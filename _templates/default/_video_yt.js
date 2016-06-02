var ytVideo = new YTVideo({
  firstPlay: true,
  videoReady: false,
  hasCloseButton: true,
  /* Enable/disable close button. */
  player: {
    'containerId': 'videoPlayer',
    'videoId': 'NpEaa2P7qZI',
    'videoWidth': 441,
    'videoHeight': 248,
    'suggestedQuality': 'medium',
    'playerVars': {
      'autoplay': 1,
      /* With autoplay enabled, the video won't get video views. */
      'rel': 0,
      'showinfo': 0
    }
  }
});

var ytJsList = [
  "https://www.gstatic.com/external_hosted/polymer/custom.elements.min.js",
  "https://www.gstatic.com/doubleclick/studio/innovation/h5/ytplayer/ytp_v2.js",
  "https://www.gstatic.com/ads/ci/ytclosebutton/1/ytclosebutton_min.js"
];

var ytLoader = new HansJSLoader(ytJsList, function() {
  ytVideo.YTFunction();
});
ytLoader.startLoad();


//console.log(ytVideo);

function YTVideo(videoSetting) {

  //----Setting up----    
  this.firstPlay = videoSetting.firstPlay;
  this.videoReady = videoSetting.videoReady;
  this.hasCloseButton = videoSetting.hasCloseButton;
  this.player = videoSetting.player;
  this.ytp = undefined;
  //  console.log(this.player);
  //  console.log(videoSetting.player);

  //------------------    

  if (this.hasCloseButton) {
    var ytCloseButton = document.createElement('ci-ytclosebutton');
    setAttributes(ytCloseButton, {
      "id": "ytClose",
      "lang": "en",
      "theme": "white",
      "shadow": "false"
    });
    container.appendChild(ytCloseButton);

  }

  //----Create video elements----
  var videoPlayer = document.createElement('div');
  setAttributes(videoPlayer, { "id": "videoplayer" });

  container.appendChild(videoPlayer);

  function setAttributes(el, attrs) {
    for (var key in attrs) {
      el.setAttribute(key, attrs[key]);
    }
  }
}

YTVideo.prototype.btnYTCloseHandler = function(e) {
  Enabler.stopTimer('YTVideo Timer');
};

YTVideo.prototype.YTFunction = function() {
  // YouTube player properties configuration.

  // YTClose Button
  if (this.hasCloseButton) document.getElementById("ytClose").addEventListener('click', this.btnYTCloseHandler, false);
  console.log(this);
  console.log(this.player.containerId);

  // Construct the YouTube player variable.
  this.ytp = new studioinnovation.YTPlayer(this.player);
  // Bind event listeners.

  this.bindListeners();
};

YTVideo.prototype.YTPlaying = function() {
  if (this.firstPlay) {
    Enabler.counter('YTVideo Play');
  } else {
    Enabler.counter('YTVideo Replay');
    this.firstPlay = true;
    if (this.ytp.isMuted) {
      this.ytp.unMute();
    }
  }
};

YTVideo.prototype.handleVideoStateChange = function(stateChangeEvent) {
  var playerState = stateChangeEvent.getPlayerState();

  switch (playerState) {
    case studioinnovation.YTPlayer.Events.PLAYING:
      this.YTPlaying();
      break;

    case studioinnovation.YTPlayer.Events.PAUSED:
      Enabler.counter('YTVideo Pause');
      Enabler.stopTimer('YTVideo Timer');
      break;

    case studioinnovation.YTPlayer.Events.TIMER_START:
      Enabler.startTimer('YTVideo Timer');
      break;

    case studioinnovation.YTPlayer.Events.TIMER_STOP:
      Enabler.stopTimer('YTVideo Timer');
      break;

    case studioinnovation.YTPlayer.Events.ENDED:
      Enabler.stopTimer('YTVideo Timer');
      this.firstPlay = false;
      break;
  }
};

YTVideo.prototype.bindListeners = function() {

  this.ytp.addEventListener('statechange', this.handleVideoStateChange, false);

  // YouTube playback quartiles.
  this.ytp.addEventListener(studioinnovation.YTPlayer.Events.VIDEO_0_PERCENT, function() {
    Enabler.counter('YTVideo Percent 0');
  }, false);
  this.ytp.addEventListener(studioinnovation.YTPlayer.Events.VIDEO_25_PERCENT, function() {
    Enabler.counter('YTVideo Percent 25');
  }, false);
  this.ytp.addEventListener(studioinnovation.YTPlayer.Events.VIDEO_50_PERCENT, function() {
    Enabler.counter('YTVideo Percent 50');
  }, false);
  this.ytp.addEventListener(studioinnovation.YTPlayer.Events.VIDEO_75_PERCENT, function() {
    Enabler.counter('YTVideo Percent 75');
  }, false);
  this.ytp.addEventListener(studioinnovation.YTPlayer.Events.VIDEO_100_PERCENT, function() {
    Enabler.counter('YTVideo Percent 100');
  }, false);
};
