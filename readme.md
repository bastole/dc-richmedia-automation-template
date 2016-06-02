DoubleClick Richmedia Automation Template (DRAT)
=======================


* DRAT is a grunt based build template for building multiple [DoubleClick rich banners](https://www.google.com/doubleclick/studio/) fast and robust.
* DRAT is for people who don't want to use HTML5 authoring tools such as Google Web Designer and Adobe Edge Animate.
* DRAT currently supports in-page formats and YouTube video - advanced dynamic, expandable and MP4 videos will be added shortly.

Features
------------

* Build multiple banners fast.
* Generates live reloading preview link to see all banners simultaneously.
* Uses Google hosted [GSAP](http://greensock.com/gsap) library. This doesn't count towards the banner's filesize.
* Strictly polite-loads every asset.
* Auto-optimizes images on build and generates size report.
* Supports embedding YouTube video.
* Supports in-page 'Close X' button for YouTube Masthead.
* Stops animation after 30 seconds to comply with Publisher's minimum specs.
* Stops animation and video on click to comply with Publisher's minimum specs.

Requirements
------------

NodeJS, Grunt, Ruby, Sass

Setting up your development environment
---------------------------------------

Once you have the above requirements installed, you can set up your development server.

### Generate your build environment

If you're on a unix-like environment, you can run:

```
$ npm install
```

DRAT will then start asking you questions and waiting for answers before continuing:

```
? What is the job number? (JOB0000)

? Project description? (Simple inpage digital banners.)

? Name of the creative? (Concept-A)

? Banner sizes under this creative - Pick as many as you want. (Press <space> to
 select)

❯◉ 300x250
 ◯ 728x90
 ◯ 300x600
 ◯ 160x600
 ◯ 120x600
 ◯ 980x150
 ◯ 970x250
 ◯ 980x250
 ◯ 970x250(+YouTube Video)
 ◯ 980x250(+YouTube Video)
(Move up and down to reveal more choices)

? Add another creative? : (y/N)

```

If you screwed up the questions and want to start again, run:
```
$ grunt reset
```

Building banners
---------------------------------------

Run the following command to have the grunt watcher build your sass, js and images as you work:

```
$ grunt
```

### /build folder

You can see in the build folder that all banner sub-folders are created.

* /build/share - Shared js and sass across all banners. Use this for universal properties such as border thickness/color, font and animation easing etc.

* /build/bannerName/images - images used for the banner. images here be compressed and sent to public folder. make sure to place your back-up static image here(GIF, PNG and JPG).

* /build/bannerName/_animate.js - GSAP timeline animation and list of images to load.

* /build/bannerName/video_yt.js - YouTube video script.

* /build/bannerName/init_dcs.js - DoubleClick Enabler listener and polite-loads GSAP from Google CDN(This doesn't count towards filesize). There's no need to modify this file.

### /public folder

dispatch-ready banners are here. All you have to do is drag each banner folder into [DoubleClick Studio UI](https://www.google.com/doubleclick/studio/).

License
---------------------------------------

The code is available under the [MIT license](LICENSE.md).

