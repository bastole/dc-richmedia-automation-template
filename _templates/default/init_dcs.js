//Initialize Enabler
if (Enabler.isInitialized()) {
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
    "https://s0.2mdn.net/ads/studio/cached_libs/tweenlite_1.18.0_56fa823cfbbef1c2f4d4346f0f0e6c3c_min.js",
    "https://s0.2mdn.net/ads/studio/cached_libs/timelinelite_1.18.0_dbe88c20554c170a56f44600f31a97d9_min.js",
    "https://s0.2mdn.net/ads/studio/cached_libs/easepack_1.18.0_ed5816e732515f56d96a67f6a2a15ccb_min.js",
    "https://s0.2mdn.net/ads/studio/cached_libs/cssplugin_1.18.0_71489205621d46cbe88348eeb8fe493f_min.js",
    "https://s0.2mdn.net/ads/studio/cached_libs/textplugin_1.18.0_08ea1916d9caf67b128788a9c0f4f6eb_min.js",
    "main.js"
  ];

  var gsapLoader = new HansJSLoader(animationJsList, function() { startMain(); });

  gsapLoader.startLoad();
}

function HansJSLoader(scriptArray, onComplete) {
  this.loadedJsNum = 0;
  this.scriptArray = scriptArray;
  this.onComplete = onComplete;
}

HansJSLoader.prototype.loadJs = function(callbackScope) {
//  console.log("loading... " + callbackScope.scriptArray[callbackScope.loadedJsNum]);
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
