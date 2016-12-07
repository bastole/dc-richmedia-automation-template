[![Build Status](https://travis-ci.org/bastole/dc-richmedia-automation-template.svg?branch=master)](https://travis-ci.org/bastole/dc-richmedia-automation-template) [![Known Vulnerabilities](https://snyk.io/test/github/bastole/dc-richmedia-automation-template/aab318b50244990268ac85d6b2981a1188f8ac0d/badge.svg)](https://snyk.io/test/github/bastole/dc-richmedia-automation-template/aab318b50244990268ac85d6b2981a1188f8ac0d)

DRAT - DoubleClick Richmedia Automation Template
=======================

![DRAT](etc/drat.png)


* [Grunt](http://gruntjs.com/) based build template for developing multiple [DoubleClick](https://www.google.com/doubleclick/studio/) rich banners concurrently.

#### Features

* Build multiple rich banners concurrently
* Polite-loads every asset
* Optimizes image on build
* Uses hosted GSAP that doesn't count towards the filesize
* Peview banners with play/pause and timeline slider
* Generate back-up GIFs with html2canvas
* Detects Ad Blocker

#### Requirements

[NodeJS](https://nodejs.org/), [Grunt](http://gruntjs.com/), [Sass](http://sass-lang.com/install)

Setting up development environment
----------------------------------

#### Install

```
$ npm install

```

#### Generate build environment

Run:

```
$ grunt start

```

![gif](http://i.imgur.com/WNpIGFl.gif)



#### Start building banners

Run grunt (default) to have the watcher build sass, js and images as you work:

```
$ grunt
```

#### Grunt Tasks

```
$ grunt start - Starts a new project(prompt, delete, create)
$ grunt - Processes banners to public/
$ grunt zip - Zips banners to /zipped for easy upload
```

```
$ grunt prompt - Creates config.json
$ grunt delete - Deletes build/ and public/
$ grunt create - Creates build/ and public/

```


#### /build folder

You can see in the build folder that all banner sub-folders are created.

* /build/shared - Shared js and sass across all banners.

* /build/[bannerName]/images - image assets used for the banner. images will be processed and copied to /public.

* /build/[bannerName]/_animate.js - Preload assets and animate.

* /build/[bannerName]/init_dcs.js - DoubleClick Enabler listener and polite-loads GSAP.

#### /public folder

dispatch-ready banners. All you have to do is drag each folder into [DoubleClick Studio UI](https://www.google.com/doubleclick/studio/).

#### /zipped folder

banners in .zip files. It's safer and much faster to upload zip files to DoubleClick. 

#### /etc folder
.


License
---------------------------------------

The code is available under the [MIT license](LICENSE.md).

