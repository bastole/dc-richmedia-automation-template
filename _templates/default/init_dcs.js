//Initialize Enabler
if (typeof Enabler == typeof undefined) {
    document.getElementById("loadingcopy").innerHTML = "Ad is<br/>blocked";
    document.getElementById("loadingcopy").style.color = "crimson";
    document.getElementById("loadingbars").style.display = "none";
    document.getElementById("loading").style.backgroundColor = "rgba(0,0,0,0.85)";
} else if (Enabler.isInitialized()) {
    init();
} else {
    Enabler.addEventListener(studio.events.StudioEvent.INIT, init);
}
//Run when Enabler is ready
function init() {
    if (Enabler.isPageLoaded()) {
        politeInit();
    } else {
        Enabler.addEventListener(studio.events.StudioEvent.PAGE_LOADED, politeInit);
    }
}

function politeInit() {
    var animationJsList = [
        "https://s0.2mdn.net/ads/studio/cached_libs/tweenmax_1.19.0_643d6911392a3398cb1607993edabfa7_min.js",
        "https://s0.2mdn.net/ads/studio/cached_libs/textplugin_1.19.0_ee0a9b7420a65afd44a2fd958cd72d16_min.js",
        "main.js"
    ];
    var gsapLoader = new HansJSLoader(animationJsList, function() { startCreative(); });
    gsapLoader.startLoad();
}

/* JS Loader Class */
function HansJSLoader(scriptArray, onComplete) {
    this.loadedJsNum = 0;
    this.scriptArray = scriptArray;
    this.onComplete = onComplete;
}
HansJSLoader.prototype.loadJs = function(callbackScope) {
    Enabler.loadScript(Enabler.getUrl(callbackScope.scriptArray[callbackScope.loadedJsNum]),
        function() { callbackScope.checkLoaded(callbackScope); });
    //Enabler.loadScript callback scope is global.
};
HansJSLoader.prototype.checkLoaded = function(callbackScope) {
    if (callbackScope.loadedJsNum == (callbackScope.scriptArray.length - 1)) {
        callbackScope.onComplete();
    } else {
        callbackScope.loadedJsNum += 1;
        callbackScope.loadJs(callbackScope);
    }
};
HansJSLoader.prototype.startLoad = function() {
    this.loadJs(this);
};


// instantiate the pre-loader with an onProgress and onComplete handler
function startCreative() {
    new preLoader(Animation.imageArray, {
        pipeline: false,
        onProgress: function(img, imageEl, index) {
            var percent = Math.floor((100 / this.queue.length) * this.completed.length);
        },
        onComplete: function(loaded, errors) {
            if (errors) {
                console.log('the following failed', errors);
            }
            for (i = 0; i < Animation.imageArray.length; i++) {
                var elem = document.createElement("img");
                elem.src = Animation.imageArray[i];
                document.getElementById(Animation.imageContainerArray[i]).appendChild(elem);
            }
            //start timeline animation
            bgexit.addEventListener('click', bgExitHandler, false);

            TweenLite.to(loading, 0.2, { autoAlpha: 0, y: -60, scale: 0.9 });
            Animation.mainTimeline.restart();
        }
    });
}
