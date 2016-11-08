//----------------------------
// Dynamic Profile Start - Remove this section if the banner is not dynamic
//----------------------------

Enabler.setProfileId(0);
var devDynamicContent = {};

devDynamicContent.JOB0000_XXX_300x250 = [{}];
devDynamicContent.JOB0000_XXX_300x250[0].clickURL = {};
devDynamicContent.JOB0000_XXX_300x250[0].clickURL.Url = "https://www.google.com.au/";
devDynamicContent.JOB0000_XXX_300x250[0].copy = "Example copy.";
Enabler.setDevDynamicContent(devDynamicContent);

var dyn = dynamicContent.JOB0000_XXX_300x250[0];

document.getElementsByClassName("copy")[0].innerHTML = dyn.copy;

//----------------------------
// Dynamic Profile End
//----------------------------

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
                Enabler.getUrl('http://lorempixel.com/' + (stageWidth - 20) + '/' + (stageHeight - 20)),
                Enabler.getUrl('http://lorempixel.com/' + stageWidth + '/' + stageHeight),
                Enabler.getUrl('http://placehold.it/100x30/ffff00/000000?text=LOGO'),
                Enabler.getUrl('http://placehold.it/110x34/00ff00/000000?text=CTA')
            ],
            imageContainerArray = [ //elemnts to contain images.
                'product',
                'bg1',
                'logo',
                'cta'
            ];

        mainTimeline = new TimelineLite({
            onComplete: function() {
                if (isLooping) mainTimeline.restart();
            }
        });

        mainTimeline
            .set(fade, { autoAlpha: 1 })
            .to(fade, fadeTime, { delay: 0.5, autoAlpha: 0 })
            .set(product, { autoAlpha: 1, scale: 3 })
            .to(product, 0.3, { scale: 1, ease: Back.easeOut.config(1.7) })
            .to(bg2, 0.2, { delay: 2.8, autoAlpha: 1 })
            .to(logo, fadeTime, { autoAlpha: 1 })
            .set(cta, { x: -300 })
            .to(cta, 0.3, { x: 0, autoAlpha: 1, ease: Power2.easeOut })
            .to(cta, 1, { delay: 5 });

        mainTimeline.pause(0);

        return {
            mainTimeline: mainTimeline,
            imageArray: imageArray,
            imageContainerArray: imageContainerArray
        };

    })();

function bgExitHandler(e) {
    if (typeof Animation !== typeof undefined) Animation.mainTimeline.pause(30);
    if (typeof dyn.clickURL.Url == typeof undefined) Enabler.exit('Background Exit');
    else Enabler.exitOverride("Dynamic Exit", dyn.clickURL.Url);
}
