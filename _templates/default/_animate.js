/*
//----------------------------
// Dynamic Profile Start - Add this section if the banner is dynamic.
//----------------------------

Enabler.setProfileId(0);
var devDynamicContent = {};

devDynamicContent.JOB0000_XXX_300x250 = [{}];
devDynamicContent.JOB0000_XXX_300x250[0].clickURL = {};
devDynamicContent.JOB0000_XXX_300x250[0].clickURL.Url = "https://www.google.com.au/";
devDynamicContent.JOB0000_XXX_300x250[0].copy = "Dynamic copy.";
Enabler.setDevDynamicContent(devDynamicContent);

var dyn = dynamicContent.JOB0000_XXX_300x250[0];
document.getElementsByClassName("copy")[0].innerHTML = dyn.copy;

//----------------------------
// Dynamic Profile End
//----------------------------
*/

var Animation =

    (function() {

        var stageWidth = container.offsetWidth,
            stageHeight = container.offsetHeight;

        var mainTimeline = new TimelineLite({
                onComplete: function() {
                    if (isLooping) mainTimeline.restart();
                }
            }),
            isLooping = false,
            fadeTime = 0.6,

            imageArray = [ //image files to load.
                Enabler.getUrl("temp_bg.jpg"),
                Enabler.getUrl("temp_logo.png"),
                Enabler.getUrl("temp_cta.png")
            ],
            imageContainerArray = [ //elemnts to contain images.
                'product',
                'logo',
                'cta'
            ];


        mainTimeline
            .set(fade, { autoAlpha: 1 })
            .to(fade, fadeTime, { delay: 0.5, autoAlpha: 0 })
            .set(product, { autoAlpha: 1, scale: 3 })
            .to(product, fadeTime, { scale: 1, ease: Back.easeOut.config(1.7) })
            .set(bg2, { x: 600 })
            .to(bg2, fadeTime, { delay: 2, autoAlpha: 1, x: 0 })
            .set(bg3, { scale: 0 })
            .to(bg3, fadeTime, { delay: 2, autoAlpha: 1, scale: 1 })
            .set(bg4, { rotation: 720 })            
            .to(bg4, fadeTime, { delay: 2, autoAlpha: 1, rotation: 0 })            
            .set(logo, { y: -600 })
            .to(logo, 1.2, { y: 0, autoAlpha: 1, ease: Power2.easeOut })
            .set(cta, { x: -600 })
            .to(cta, 1.2, { x: 0, autoAlpha: 1, ease: Power2.easeOut })
//            .to(cta, fadeTime, { delay: 7 })
;

        mainTimeline.pause(0);

        return {
            mainTimeline: mainTimeline,
            imageArray: imageArray,
            imageContainerArray: imageContainerArray
        };

    })();

function bgExitHandler(e) {
//    if (typeof Animation !== typeof undefined) Animation.mainTimeline.pause(30);
    
    if (typeof dyn == typeof undefined) {
        Enabler.exit('Background Exit');
    }
    else {
        Enabler.exit('Background Exit');
        Enabler.exitOverride("Background Exit", dyn.clickURL.Url);
    }
}

// for Preview: TimeLine is ready.
var callOutside = window.parent.iFrameAnimationLoaded;
if (typeof window.parent.iFrameAnimationLoaded !== "undefined") { 
    callOutside(document.title);
}



