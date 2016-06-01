
var hasVideo_YT = true;

if (hasVideo_YT) {

  var animationJsList = [
    "https://www.gstatic.com/external_hosted/polymer/custom.elements.min.js",
    "https://www.gstatic.com/ads/ci/ytclosebutton/1/ytclosebutton_min.js",
    "https://www.gstatic.com/doubleclick/studio/innovation/h5/ytplayer/ytp_v2.js",
    "video.js"
  ];

  var ytLoader = new HansJSLoader(animationJsList, function() { YTFunction(); });

  ytLoader.startLoad();

}

// instantiate the pre-loader with an onProgress and onComplete handler
function startMain() {
  new preLoader(imageArray, {
    pipeline: false,
    onProgress: function(img, imageEl, index) {
      var percent = Math.floor((100 / this.queue.length) * this.completed.length);
    },
    onComplete: function(loaded, errors) {
      if (errors) {
        console.log('the following failed', errors);
      }
      for (i = 0; i < imageArray.length; i++) {
        var elem = document.createElement("img");
        elem.src = imageArray[i];
        document.getElementById(imagrContainerArray[i]).appendChild(elem);
      }
      initAnimation();
    }
  });
}

function initAnimation() {
  bgexit.addEventListener('click', bgExitHandler, false);
  TweenLite.to(loading, 0.3, { autoAlpha: 0, y: -30 });
  playMainTimeline();
}

function bgExitHandler(e) {
  if (ytp != undefined) ytp.pauseVideo();

  mainTimeline.pause(30);
  Enabler.exit('Background Exit');
}
