

# DRAT - DoubleClick Richmedia Automation Template [![Build Status](https://travis-ci.org/bastole/dc-richmedia-automation-template.svg?branch=master)](https://travis-ci.org/bastole/dc-richmedia-automation-template) [![Known Vulnerabilities](https://snyk.io/test/github/bastole/dc-richmedia-automation-template/aab318b50244990268ac85d6b2981a1188f8ac0d/badge.svg)](https://snyk.io/test/github/bastole/dc-richmedia-automation-template/aab318b50244990268ac85d6b2981a1188f8ac0d)


![DRAT](etc/drat.png)

>  [Grunt](http://gruntjs.com/) based build template for developing multiple [DoubleClick](https://www.google.com/doubleclick/studio/) rich banners concurrently.

## Features

* Build multiple rich banners concurrently
* Polite-loads every asset
* Optimizes image on build
* Uses hosted GSAP that doesn't count towards the filesize
* Peview banners with animation control
* Generate back-up GIFs with html2canvas
* Detects Ad Blocker

## Requirements

[NodeJS](https://nodejs.org/), [Grunt](http://gruntjs.com/), [Sass](http://sass-lang.com/install)

## Getting Started

### Install

```
$ npm install

```

### Set up a new project

_Run this task :

```
$ grunt start

```

![Setting up a new project](http://i.imgur.com/BIzINs7.gif)


### Start building banners

_Run default grunt to have the watcher build sass, js and images as you work:

```
$ grunt

```

![Preview screen](http://i.imgur.com/SQd33dm.png)


### /build folder


* /build/shared - Shared js and sass across all banners.

* /build/[bannerName]/images - Image will be processed and copied to /public/[bannerName].

* /build/[bannerName]/_animate.js - Preload assets and animate.

### /public folder

dispatch-ready banners.


### Grunt Tasks

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


License
---------------------------------------

The code is available under the [MIT license](LICENSE.md).

