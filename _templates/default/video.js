//----Setting up----    

var ytp,
  firstPlay = true,
  videoReady = false,

  player = {
    'containerId': videoPlayer,
    'videoId': 'NpEaa2P7qZI',
    'videoWidth': 441,
    'videoHeight': 248,
    'suggestedQuality': 'medium',
    'playerVars': {
      'autoplay': 0,
      /*With autoplay enabled, the video won't get video views. */
      'rel': 0,
      'showinfo': 0,
    }
  };


//----YTClose Button----
function btnYTCloseHandler(e) {
  Enabler.stopTimer('YTVideo Timer');
}

//----YouTube Player----
function YTFunction(){
  // YouTube player properties configuration.

  // YTClose Button
  document.getElementById("ytClose").addEventListener('click', btnYTCloseHandler, false);


  // Construct the YouTube player variable.
 ytp = new studioinnovation.YTPlayer(player);
  // Bind event listeners.
  bindListeners();
}

function YTPlaying(){
  if(firstPlay){
    Enabler.counter('YTVideo Play');
  }
  else{
    Enabler.counter('YTVideo Replay');
    firstPlay = true;
    if(ytp.isMuted){
      ytp.unMute();
    }
  } 
}

// YT Player State
function handleVideoStateChange(stateChangeEvent){
  var playerState = stateChangeEvent.getPlayerState();

  switch(playerState){ 
    case studioinnovation.YTPlayer.Events.PLAYING:
      YTPlaying();          
    break;

    case studioinnovation.YTPlayer.Events.PAUSED:
      Enabler.counter('YTVideo Pause');
      Enabler.stopTimer('YTVideo Timer');
    break;

    case  studioinnovation.YTPlayer.Events.TIMER_START:
      Enabler.startTimer('YTVideo Timer');
    break;

    case  studioinnovation.YTPlayer.Events.TIMER_STOP:
      Enabler.stopTimer('YTVideo Timer');
    break;

    case studioinnovation.YTPlayer.Events.ENDED:
      Enabler.stopTimer('YTVideo Timer');
      firstPlay = false;
    break;
  }
}

function bindListeners(){
  
  ytp.addEventListener('statechange', handleVideoStateChange, false);

  // YouTube playback quartiles.
  ytp.addEventListener(studioinnovation.YTPlayer.Events.VIDEO_0_PERCENT, function() {
    Enabler.counter('YTVideo Percent 0');
  }, false);
  ytp.addEventListener(studioinnovation.YTPlayer.Events.VIDEO_25_PERCENT, function() {
    Enabler.counter('YTVideo Percent 25');
  }, false);
  ytp.addEventListener(studioinnovation.YTPlayer.Events.VIDEO_50_PERCENT, function() {
    Enabler.counter('YTVideo Percent 50');
  }, false);
  ytp.addEventListener(studioinnovation.YTPlayer.Events.VIDEO_75_PERCENT, function() {
    Enabler.counter('YTVideo Percent 75');
  }, false);
  ytp.addEventListener(studioinnovation.YTPlayer.Events.VIDEO_100_PERCENT, function() {
    Enabler.counter('YTVideo Percent 100');
  }, false);
}