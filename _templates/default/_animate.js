var mainTimeLine;

(function() {
  var
    isLooping = false,
    fadeTime = 0.6,

    imageArray = [
      Enabler.getUrl('temp_product.png'),
      Enabler.getUrl('temp_logo.png'),
      Enabler.getUrl('temp_cta.png')
    ],
    imagrContainerArray = [
      'product',
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
})();
