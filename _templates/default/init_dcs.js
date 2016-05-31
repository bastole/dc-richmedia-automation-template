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

var loadedJsNum = 0;
var jsObj = [
  "https://s0.2mdn.net/ads/studio/cached_libs/tweenlite_1.18.0_56fa823cfbbef1c2f4d4346f0f0e6c3c_min.js",
  "https://s0.2mdn.net/ads/studio/cached_libs/timelinelite_1.18.0_dbe88c20554c170a56f44600f31a97d9_min.js",
  "https://s0.2mdn.net/ads/studio/cached_libs/easepack_1.18.0_ed5816e732515f56d96a67f6a2a15ccb_min.js",
  "https://s0.2mdn.net/ads/studio/cached_libs/cssplugin_1.18.0_71489205621d46cbe88348eeb8fe493f_min.js",
  "https://s0.2mdn.net/ads/studio/cached_libs/textplugin_1.18.0_08ea1916d9caf67b128788a9c0f4f6eb_min.js",
  Enabler.getUrl("main.js")
];

function politeInit() {
  loadJs(jsObj[loadedJsNum]);
}

function checkLoaded() {
  if (loadedJsNum == (jsObj.length - 1)) {
  	startMain();
  } else {
    loadedJsNum += 1;
    loadJs(jsObj[loadedJsNum]);
  }
}

function loadJs(jsUrl) {
  Enabler.loadScript(jsUrl, checkLoaded);
}

function bgExitHandler(e) {
  mainTimeline.pause(30);
  Enabler.exit('Background Exit');
}
