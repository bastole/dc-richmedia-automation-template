[![Build Status](https://travis-ci.org/bastole/dc-richmedia-automation-template.svg?branch=master)](https://travis-ci.org/bastole/dc-richmedia-automation-template) [![Known Vulnerabilities](https://snyk.io/test/github/bastole/dc-richmedia-automation-template/aab318b50244990268ac85d6b2981a1188f8ac0d/badge.svg)](https://snyk.io/test/github/bastole/dc-richmedia-automation-template/aab318b50244990268ac85d6b2981a1188f8ac0d)

DRAT - [DoubleClick Richmedia](https://www.google.com/doubleclick/studio/) Automation Template
=======================

![DRAT](etc/drat.png)


* DRAT is a [grunt](http://gruntjs.com/) based build template for developing multiple [DoubleClick](https://www.google.com/doubleclick/studio/) rich banners simultaneously.
* DRAT is to build banners without using [Google Web Designer.](http://www.google.com/webdesigner/)
* DRAT currently supports in-page format and YouTube - other formats will be added shortly.

#### Features

* Build and preview multiple banners simultaneously.
* Strictly polite-loads every asset.
* Optimizes every image on build and generates size report.
* Uses Google hosted [GSAP](http://greensock.com/gsap). This doesn't count towards the publisher's filesize.
* Animation stops after 30 seconds to comply with the recommended spec.
* Video and Animation stops on click to comply with the recommended spec.

#### Requirements

[NodeJS](https://nodejs.org/), [Grunt](http://gruntjs.com/), [Sass](http://sass-lang.com/install)

Setting up your development environment
---------------------------------------


Once you have the above requirements installed, you can set up your development server.

```
$ npm install

```


#### Generate your build environment

Run:

```
$ grunt create

```

![gif](http://i.imgur.com/u3AqT2P.gif)


To start the questions again, run:
```
$ grunt reset
```
...or manually update config.json.

#### Start building banners

Run the grunt (default) to have the grunt watcher build your sass, js and images as you work:

```
$ grunt
```

#### Other Grunt Tasks

```
$ grunt - Processes banners to public/
$ grunt clean:reset - Deletes build/ and public/
$ grunt prompt - Creates config.json
$ grunt setUp - Creates build/ and public/preview.html
$ grunt reset - prompt, clean:reset, setUp
$ grunt restart - clean:reset, setUp, grunt
$ grunt zip - Creates /zipped folder and compressed banners

```


#### /build folder

You can see in the build folder that all banner sub-folders are created.

* /build/share - Shared js and sass across all banners. Use this for universal properties such as border thickness/color and font.

* /build/bannerName/images - images used for the banner. images dumped here will be compressed and copied to public folder. Leave the back-up static image here(GIF/PNG/JPG).

* /build/bannerName/_animate.js - Preload assets, set Dynamic Profile and animate with GSAP timeline.

* /build/bannerName/video_yt.js - YouTube video script.

* /build/bannerName/init_dcs.js - DoubleClick Enabler listener and polite-loads GSAP from Google CDN(This doesn't count towards max filesize). There's no need to modify this file.

#### /public folder

dispatch-ready banners. All you have to do is drag each folder into [DoubleClick Studio UI](https://www.google.com/doubleclick/studio/).

#### /zipped folder

banners in .zip files. It's safer and much faster to upload compressed files to DoubleClick. 

#### /etc folder
This folder contains bits and pieces.
back-up static image template in PSD. On e uploaded to DoubleClick, a GIF/JPG/PNG file including 'backup' in filename will automatically be assigned as a back-up image.

License
---------------------------------------

The code is available under the [MIT license](LICENSE.md).
