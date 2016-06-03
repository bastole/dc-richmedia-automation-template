DRAT - [DoubleClick Richmedia](https://www.google.com/doubleclick/studio/) Automation Template
=======================

![DRAT](https://googledrive.com/host/0B_PD2TmpY-olSm5BQWJnX09lODA/drat.png)

* DRAT is a [grunt](http://gruntjs.com/) based build template for developing multiple [DoubleClick](https://www.google.com/doubleclick/studio/) rich banners simultaneously.
* DRAT is for people who want to build cool things outside the limits of [HTML5 authoring tools.](http://www.google.com/webdesigner/)
* DRAT currently supports in-page format and YouTube video - other formats will be added shortly.

#### Features

* Build and preview multiple banners simultaneously.
* Strictly polite-loads every asset.
* Optimizes every image on build and generates size report.
* Supports embedding YouTube video and 'Close X' button.
* Uses Google hosted [GSAP](http://greensock.com/gsap). This doesn't count towards the publisher's filesize.
* Animation stops after 30 seconds to comply with the recommended spec.
* Video and Animation stops on click to comply with the recommended spec.

#### Requirements

[NodeJS](https://nodejs.org/), [Grunt](http://gruntjs.com/), [Sass](http://sass-lang.com/install)

Setting up your development environment
---------------------------------------

Once you have the above requirements installed, you can set up your development server.

#### Generate your build environment

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
...or manually update config.json.

#### Start building banners

Run the following command to have the grunt watcher build your sass, js and images as you work:

```
$ grunt
```

#### /build folder

You can see in the build folder that all banner sub-folders are created.

* /build/share - Shared js and sass across all banners. Use this for universal properties such as border thickness/color and font etc.

* /build/bannerName/images - images used for the banner. images dumped here will be compressed and sent to public folder. make sure to include your back-up static image here(GIF, PNG and JPG).

* /build/bannerName/_animate.js - This is where most of the action happens. GSAP timeline animation and list of images to load.

* /build/bannerName/video_yt.js - YouTube video script.

* /build/bannerName/init_dcs.js - DoubleClick Enabler listener and polite-loads GSAP from Google CDN(This doesn't count towards filesize). There's no need to modify this file.

#### /public folder

dispatch-ready banners. All you have to do is drag each folder into [DoubleClick Studio UI](https://www.google.com/doubleclick/studio/).

License
---------------------------------------

The code is available under the [MIT license](LICENSE.md).

