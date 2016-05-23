
var
  isLooping = true,
  fadeTime = 0.6,

  //
  imageArray = [
    Enabler.getUrl('mr_g1.png'),
    Enabler.getUrl('mr_g2.png'),
    Enabler.getUrl('mr_logo.png'),
    Enabler.getUrl('mr_t_last.png'),
    Enabler.getUrl('mr_cta.png')
  ],
  imagrContainerArray = [
    'g1',
    'g2',
    'logo',
    't_last',
    'cta'
  ];

var mainTimeline = new TimelineLite({ onComplete: loopMainTimeline });

function loopMainTimeline() {
  if (isLooping) mainTimeline.restart();
}
function playMainTimeline() {
  mainTimeline.restart();
}

mainTimeline
.set(fade, { autoAlpha: 1 })
  .to(fade, fadeTime, { delay: 0.5, autoAlpha: 0 })
  .set(g1, { autoAlpha: 1, scale: 3 })
  .to(g1, 0.3, { scale: 1, ease: Back.easeOut.config(1.7) })
  .set(g2, { delay: 0.7, autoAlpha: 1, scale: 3 })
  .to(g2, 0.3, { scale: 1, ease: Back.easeOut.config(1.7) })
  .to(bg2, 0.2, { delay: 2.8, autoAlpha: 1 })
  .to(logo, fadeTime, { autoAlpha: 1 })
  .to(t_last, fadeTime, { autoAlpha: 1 })
  .set(cta, { x: -300 })
  .to(cta, 0.3, { x: 0, autoAlpha: 1, ease: Power2.easeOut })
  .to(cta, 1, { delay: 5 });

//
mainTimeline.pause(0);
