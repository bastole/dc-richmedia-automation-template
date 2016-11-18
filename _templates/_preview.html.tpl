<!DOCTYPE html>
<html>

<head>
    <title>Preview</title>
    <style type="text/css">
    body {
        padding-bottom: 50px;
        font: 14px/1.5 Lato, "Helvetica Neue", Helvetica, Arial, sans-serif;
        color: #777;
        font-weight: 300;
    }
    
    * {
        margin: 0;
        padding: 0;
        text-align: center;
    }
    
    header {
        position: fixed;
        width: 100%;

        margin-bottom: 50px;
        z-index: 10000;

        padding: 10px 0;
        background-color: rgba(0, 0, 0, 0.7);


/*        background-color: black;
        padding: 30px 0;*/

    }
    
    header,
    #main,
    #header-top {

    }
    
    #header-logo,
    #page-title,
    #page-description {

        -webkit-transform: translateY(-10px) scale(0);
        transform: translateY(-10px) scale(0);


    }
    
    #header-top {
        overflow: hidden;
        max-height: 0;
    }
    
        
    h1 {
        color: white;
        font-size: 38px;
        font-weight: 400;
    }
    
    h2 {
        padding: 16px 0;
        font-weight: 400;
    }
    
    p {
        font-size: 20px;
        line-height: 140%;
        font-weight: 400;
    }
    
    a {
        text-decoration: none;
    }
    
    nav {
        position: fixed;
        top: 10px;
        left: 10px;
        z-index: 20000;
    }
    
    nav ul {
        border-radius: 40px;
        border: 2px solid #666;
        list-style-type: none;
        background-color: black;
        color: #DDD;
        font-size: 11px;
        padding: 2px;
        text-decoration: none;
        max-height: 34px;
        max-width: 34px;
        overflow: hidden;
        -webkit-transition: border-radius 0.1s linear 0.1s, max-height 0.1s linear, max-width 0.1s linear 0.1s, background-color 0.2s linear;
        transition: border-radius 0.1s linear 0.1s, max-height 0.1s linear, max-width 0.1s linear 0.1s, background-color 0.2s linear;
    }
    
    nav ul:hover {
        border-radius: 0;
        max-height: 1400px;
        max-width: 240px;
        border: 2px solid black;
        background-color: white;
        color: #333;
        -webkit-transition: border-radius 0.2s linear, max-height 1.4s linear 0.2s, max-width 0.2s linear, background-color 0.4s linear;
        transition: border-radius 0.2s linear, max-height 1.4s linear 0.2s, max-width 0.2s linear, background-color 0.4s linear;
    }
    
    nav ul li {
        padding: 4px 12px;
        text-align: left;
    }
    
    nav ul li a {
        text-decoration: none;
        color: inherit;
        padding: 4px 0;
    }
    
    nav ul li:nth-child(1) {
        font-size: 12px;
        padding-top: 8px;
        padding-bottom: 10px;
        padding-left: 11.5px;
        min-width: 150px;
    }
    
    nav ul li:nth-child(1) a i:nth-child(1) {
        padding-right: 12px;
    }
    
    nav ul li:nth-child(1) a i:nth-child(2) {
        padding-left: 12px;
    }
    
    nav ul li:last-child {
        margin-bottom: 10px;
    }
    
    nav ul .nav-item:hover {
        background-color: #0078e7;
    }
    
    nav ul .nav-item:hover a {
        color: white;
    }
    
    #main {
        padding-top: 360px;
    }
    
    #warning {
        color: white;
        background-color: crimson;
        padding: 20px 0;
        display: none;
    }
    
    #page-description {
        padding: 20px 0;
    }
    /* Simple button*/
    
    .control-section {}
    
    .control-section.not-active .button {
        pointer-events: none;
        cursor: default;
        color: #999;
        background-color: #aaa;
    }
    
    .button {
        background-color: #e6e6e6;
        border-radius: 2px;
        border: 0;
        display: inline-block;
        cursor: pointer;
        color: #666;
        font-size: 11px;
        padding: 6px 10px;
        text-decoration: none;
        margin: 8px 3px;
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }
    
    .button:hover {
        background-color: #0078e7;
        color: white;
    }
    
    .button:active {
        position: relative;
        top: 1px;
    }
    
    .long i {
        padding-right: 2px;
    }
    
    .slider-section {
        /* rail */
        width: 0;
        height: 21px;
        overflow: hidden;
        display: inline-block;
        vertical-align: middle;
        -webkit-transition: all 0.2s ease;
        transition: all 0.2s ease;
    }
    
    .iframe-wrapper {
        margin: 0 auto;
        display: inline-block;
        vertical-align: top;
        padding-bottom: 150px;
        -webkit-transition: all 0.2s linear;
        transition: all 0.2s linear;
    }
    
    #main {
        /*        animation: slideIn 1.2s cubic-bezier(0,1,.02,1) 0s 1 normal forwards running;
*/
    }
    
    @keyframes slideIn {
        from {
            opacity: 1;
            transform: translateY(-3000px);
        }
    }
    
    @keyframes slideInHeader {
        from {
            opacity: 1;
            transform: translateY(-400px);
        }
    }
    
    iframe {
        margin: 0 auto;
        border: none;
        display: block;
        -webkit-transition: all 0.2s cubic-bezier(0, 0, 1, 0.43);
        transition: all 0.2s cubic-bezier(0, 0, 1, 0.43);
    }
    
    .zoom-out {
        -webkit-transform: scale(0.5);
        transform: scale(0.5);
        -webkit-transform-origin: 0% 0%;
        transform-origin: 0% 0%;
        -webkit-transition: all 0.2s cubic-bezier(0, 0.57, 1, 1);
        transition: all 0.2s cubic-bezier(0, 0.57, 1, 1);
    }
    
    #header-buttons {
        font-size: 0;
    }
    
    #header-buttons ul {
        list-style: none;
        padding: 0;
        background: #eee;
        border-radius: 2px;
        border: 0;
        width: 300px;
        display: inline-block;
        margin: 0 auto;
    }
    
    #header-buttons ul li {
        box-sizing: border-box;
        display: block;
        width: 100px;
        float: left;
        border-right: 1px solid rgba(0, 0, 0, 0.3);
        border-left: 1px solid rgba(255, 255, 255, 0.3);
    }
    
    #header-buttons ul li:hover {
        background-color: #0078e7;
    }
    
    #header-buttons ul li:hover a,
    #header-buttons ul li:hover a strong {
        color: white;
        -webkit-transform: scale(1.04);
        transform: scale(1.04);
        -webkit-transform-origin: 50% 50%;
        transform-origin: 50% 50%;
    }
    
    .button,
    #header-buttons ul li,
    #header-buttons ul li a,
    #header-buttons ul li a strong {
        -webkit-transition: all 0.2s ease;
        transition: all 0.2s ease;
    }
    
    #header-buttons ul li:first-child {
        border-radius: 2px 0 0 2px;
        border-left: none;
    }
    
    #header-buttons ul li:last-child {
        border-radius: 0 2px 2px 0;
        border-right: none;
    }
    
    #header-buttons ul a {
        line-height: 1;
        font-size: 12px;
        color: #999;
        display: block;
        text-align: center;
        padding: 8px 0;
        font-weight: 400;
        text-decoration: none;
    }
    
    #header-buttons ul a strong {
        font-size: 15px;
        display: block;
        color: #222;
        font-weight: 700;
        padding-top: 3px;
    }
    /* Icon start */
    
    @font-face {
        font-family: 'preview-icon';
        src: url('data:application/octet-stream;base64,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') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    
    [class^="icon-"]:before,
    [class*=" icon-"]:before {
        font-family: "preview-icon";
        font-style: normal;
        font-weight: normal;
        speak: none;
        display: inline-block;
        text-decoration: inherit;
        width: 1em;
        text-align: center;
        font-variant: normal;
        text-transform: none;
        line-height: 1em;
        /* font-size: 120%; */
    }
    
    .icon-picture:before {
        content: '\e800';
    }
        
    .icon-camera:before {
        content: '\e801';
    }
        
    .icon-down-dir:before {
        content: '\e802';
    }
        
    .icon-attention:before {
        content: '\e803';
    }
        
    .icon-attention-circled:before {
        content: '\e804';
    }
        
    .icon-play:before {
        content: '\e805';
    }
        
    .icon-pause:before {
        content: '\e806';
    }
        
    .icon-to-start-alt:before {
        content: '\e807';
    }
        
    .icon-up-dir:before {
        content: '\e808';
    }
        
    .icon-link-ext:before {
        content: '\f08e';
    }
        
    .icon-menu:before {
        content: '\f0c9';
    }
        
    .icon-link-ext-alt:before {
        content: '\f14c';
    }
        
    .icon-sliders:before {
        content: '\f1de';
    }
    /* Icon end */
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <!--  <script src="https://use.fontawesome.com/9fbee15718.js"></script> -->
    <script src='https://s0.2mdn.net/ads/studio/Enabler.js'></script>
    <script src="html2canvas.js"></script>
    <script src="https://s0.2mdn.net/ads/studio/cached_libs/tweenmax_1.19.0_643d6911392a3398cb1607993edabfa7_min.js"></script>
    <script src="gsap-timeline-slider.js"></script>
</head>

<body>
    <header class="expanded">
        <section id="header-top">
            <div id="header-logo" style="width: 48px; height: 48px; position: relative; margin: 0 auto;">

                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 180 171.6" xml:space="preserve">
                    <g>
                        <path style="fill: #fff;" d="M86,59.6c16.6-10.2,38.1-11.5,56.3-1.6c0-0.5,0-1.1,0-1.6C142.4,25.2,117.1,0,86,0C54.9,0,29.6,25.2,29.6,56.4     c0,0.6,0,1.1,0,1.6C47.9,48.2,69.4,49.4,86,59.6"></path>
                        <path style="fill: #fff;" d="M59.2,106c-17.2-9.3-29-27.2-29.6-48c-0.5,0.3-1,0.5-1.4,0.8c-27,15.6-36.2,50.1-20.6,77c15.6,27,50.1,36.2,77,20.6        c0.5-0.3,0.9-0.6,1.4-0.9C68.3,144.7,58.7,125.6,59.2,106"></path>
                        <path style="fill: #fff;" d="M143.8,58.8c-0.5-0.3-1-0.5-1.4-0.8c-0.6,20.8-12.4,38.7-29.6,48c0.5,19.5-9.1,38.7-26.8,49.6c0.5,0.3,0.9,0.6,1.4,0.9     c27,15.6,61.5,6.3,77-20.6C180,108.9,170.8,74.4,143.8,58.8"></path>
                    </g>
                    <g>
                        <defs>
                            <rect id="SVGID_1_" x="-202.5" y="-137.7" width="86" height="106"></rect>
                        </defs>
                        <clipPath id="SVGID_2_">
                            <use xlink:href="#SVGID_1_" style="overflow:visible;"></use>
                        </clipPath>
                    </g>
                </svg>
            </div>
            <h1 id="page-title"></h1>
            <p id="page-description"></p>
            <p id="warning"><i class="icon-attention"></i> Turn off the Ad blocker </p>
        </section>
        <section id="header-buttons">
            <ul>
                <li><a href="#" id="compactViewToggle" onclick="compactViewToggle(event)">View on <strong>Compact</strong></a></li>
                <li><a href="#" id="showLastFrame" onclick="screenshotAll(event)">Screenshot <strong>Everything</strong></a></li>
                <li><a href="#" id="zoomOutToggle" onclick="zoomOutToggle(event)">Zoom on <strong>0.5x</strong></a></li>
            </ul>
        </section>
    </header>
    <nav>
        <ul>
            <li><a id="scroll-to-top" href="#"><i class="icon-menu"></i> Scroll to Top <i class="icon-up-dir"></i></a></li>
        </ul>
    </nav>
    <section id="main"></section>
    <script>
    if (typeof Enabler == typeof undefined) {
        document.getElementById("warning").style.display = "block";
    }
    var
        main = document.getElementById("main"),
        pageTitle = document.getElementById("page-title"),
        pageDescription = document.getElementById("page-description"),
        headerLogo = document.getElementById("header-logo"),
        headerTop = document.getElementById("header-top"),
        header = document.getElementsByTagName("header")[0];

    //Collapsiing header

    $(window).scroll(function() {
        if ($(window).scrollTop()) {
TweenLite.to(header, 0.5, { css: {padding:"10px 0", backgroundColor:"rgba(0, 0, 0, 0.7)"}, ease: Power2.easeOut });
TweenLite.to(headerTop, 0.5, { css: {maxHeight:"0"}, ease: Power2.easeOut });

TweenLite.to(headerLogo, 0.3, { scale:0, y:-10, ease: Power2.easeOut });
TweenLite.to(pageTitle, 0.3, { scale:0, y:-10, ease: Power2.easeOut });
TweenLite.to(pageDescription, 0.3, { scale:0, y:-10, ease: Power2.easeOut });

        } else {
TweenLite.to(header, 0.5, { css: {padding:"30px 0", backgroundColor:"black"}, ease: Power2.easeOut });
TweenLite.to(headerTop, 0.5, { css: {maxHeight:"800px"}, ease: Power2.easeOut });

TweenLite.to(headerLogo, 0.3, { scale:1, y:0, ease: Power2.easeOut, delay:0.2 });
TweenLite.to(pageTitle, 0.3, { scale:1, y:0, ease: Power2.easeOut, delay:0.2 });
TweenLite.to(pageDescription, 0.3, { scale:1, y:0, ease: Power2.easeOut, delay:0.2 });

        }
    });
    
     $(document).ready(function() {
        if ($(window).scrollTop()) {
TweenLite.set(header, { css: {padding:"10px 0", backgroundColor:"rgba(0, 0, 0, 0.7)"} });
TweenLite.set(headerTop, { css: {maxHeight:"0"} });

TweenLite.set(headerLogo, { scale:0, y:-10 });
TweenLite.set(pageTitle, { scale:0, y:-10 });
TweenLite.set(pageDescription, { scale:0, y:-10 });

        } else {
TweenLite.set(header, { css: {padding:"30px 0", backgroundColor:"black"} });
TweenLite.set(headerTop, { css: {maxHeight:"800px"} });

TweenLite.set(headerLogo, { scale:1, y:0 });
TweenLite.set(pageTitle, { scale:1, y:0 });
TweenLite.set(pageDescription, { scale:1, y:0 });

        }
    });   

    function collapseHeader(){
TweenLite.to(header, 0.5, { css: {padding:"10px 0", backgroundColor:"rgba(0, 0, 0, 0.7)"}, ease: Power2.easeOut });
TweenLite.to(headerTop, 0.5, { css: {maxHeight:"0"}, ease: Power2.easeOut });

TweenLite.to(headerLogo, 0.5, { scale:0, y:-250, ease: Power2.easeOut });
TweenLite.to(pageTitle, 0.5, { scale:0, y:-250, ease: Power2.easeOut });
TweenLite.to(pageDescription, 0.5, { scale:0, y:-250, ease: Power2.easeOut });

    }
    function expandHeader(){
TweenLite.to(header, 0.5, { css: {padding:"30px 0", backgroundColor:"black"}, ease: Power2.easeOut });
TweenLite.to(headerTop, 0.5, { css: {maxHeight:"800px"}, ease: Power2.easeOut });

TweenLite.to(headerLogo, 0.5, { scale:1, y:0, ease: Power2.easeOut });
TweenLite.to(pageTitle, 0.5, { scale:1, y:0, ease: Power2.easeOut });
TweenLite.to(pageDescription, 0.5, { scale:1, y:0, ease: Power2.easeOut });

    }

    var config = <%=config%>;

    var folderList = [];
    var sizeList = [];

    for (var i = 0; i < config.list.length; i++) {
        for (var j = 0; j < config.list[i].dimension.length; j++) {
            folderList.push(config.jobnumber.concat("_", config.list[i].creative, "_", config.list[i].dimension[j], "/"));
            sizeList.push(config.list[i].dimension[j]);
        }
    }
    var width = sizeList.map(function(a) {
        return a.match(/(\d+)/g)[0];
    });
    var height = sizeList.map(function(a) {
        return a.match(/(\d+)/g)[1];
    });

    document.getElementsByTagName("title")[0].innerHTML = config.jobnumber + " Preview";
    document.getElementsByTagName("h1")[0].innerHTML = config.jobnumber;
    document.getElementsByTagName("p")[0].innerHTML = config.description;

    var sliderArray = new Array(folderList.length);
    var isSliderOn = new Array(folderList.length);

    for (var i = 0; i < folderList.length; i++) {
        isSliderOn[i] = false;

        preparePreview(folderList[i], width[i], height[i], i);
    }


    document.getElementById("scroll-to-top").addEventListener('click', function(evt) {
        evt.preventDefault();
        $('html, body').animate({
            scrollTop: 0
        }, 250);
    }, false);

    function preparePreview(folderList, width, height, i) {
        var subheading = document.createElement("h2");
        subheading.innerHTML = folderList.replace('/', '');
        subheading.setAttribute('id', "heading-" + folderList.replace('/', ''));
        main.appendChild(subheading);

        var controlSection = document.createElement("section");
        controlSection.setAttribute('class', "control-section not-active");
        controlSection.setAttribute('id', "control-section-" + folderList.replace('/', ''));
        main.appendChild(controlSection);

        //
        var anch = document.createElement("a");
        anch.innerHTML = '<i class="icon-link-ext"></i>';
        anch.setAttribute('title', "Open this banner in a new tab");
        anch.setAttribute('href', folderList);
        anch.setAttribute('target', '_blank');
        anch.className += " button";
        controlSection.appendChild(anch);

        var capt = document.createElement("a");
        capt.innerHTML = '<i class="icon-camera"></i>';
        capt.setAttribute('title', "Screenshot this banner");
        capt.setAttribute('href', "#");
        capt.className += " button";
        capt.addEventListener('click', function(evt) {
            evt.preventDefault();
            screenshotSelected(i);
        }, false);
        controlSection.appendChild(capt);

        //Rewind Button
        var bannerRewind = document.createElement("a");
        bannerRewind.innerHTML = '<i class="icon-to-start-alt"></i>';
        bannerRewind.setAttribute('title', "Rewind");
        bannerRewind.setAttribute('href', "#");
        bannerRewind.className += " button";
        bannerRewind.addEventListener('click', function(evt) {
            evt.preventDefault();
            if (typeof iFrameTags[i].contentWindow.Animation !== typeof undefined) {
                iFrameTags[i].contentWindow.Animation.mainTimeline.play(0);
            }
        }, false);
        controlSection.appendChild(bannerRewind);

        //
        //Timeline Slider
        var sliderSection = document.createElement("section");
        sliderSection.setAttribute('id', "slider-" + folderList.replace('/', ''));
        sliderSection.setAttribute('class', "slider-section");

        controlSection.appendChild(sliderSection);
        //

        //Pause Button
        var bannerPause = document.createElement("a");
        bannerPause.innerHTML = '<i class="icon-pause"></i>';
        bannerPause.setAttribute('title', "Pause");
        bannerPause.setAttribute('href', "#");
        bannerPause.className += " button";
        bannerPause.addEventListener('click', function(evt) {
            evt.preventDefault();
            if (typeof iFrameTags[i].contentWindow.Animation !== typeof undefined) {
                iFrameTags[i].contentWindow.Animation.mainTimeline.pause();
            }
        }, false);
        controlSection.appendChild(bannerPause);

        //Play Button
        var bannerPlay = document.createElement("a");
        bannerPlay.innerHTML = '<i class="icon-play"></i>';
        bannerPlay.setAttribute('title', "Play");
        bannerPlay.setAttribute('href', "#");
        bannerPlay.className += " button";
        bannerPlay.addEventListener('click', function(evt) {
            evt.preventDefault();
            if (typeof iFrameTags[i].contentWindow.Animation !== typeof undefined) {
                iFrameTags[i].contentWindow.Animation.mainTimeline.play();
            }
        }, false);
        controlSection.appendChild(bannerPlay);

        var ifrmWrapper = document.createElement("div");
        ifrmWrapper.setAttribute("class", "iframe-wrapper");
        ifrmWrapper.style.width = width + "px";
        ifrmWrapper.style.height = height + "px";
        main.appendChild(ifrmWrapper);

        var ifrm = document.createElement("iframe");
        ifrm.setAttribute("src", folderList + "index.html");
        ifrm.setAttribute("id", folderList.replace('/', ''));
        ifrm.setAttribute("elemnum", i);
        ifrm.style.width = width + "px";
        ifrm.style.height = height + "px";
        ifrmWrapper.appendChild(ifrm);

        var navItem = document.createElement("li");
        navItem.setAttribute('class', "nav-item");
        var navItemAnch = document.createElement("a");
        navItemAnch.innerHTML = folderList.replace('/', '');
        navItemAnch.setAttribute('href', "#");
        navItem.appendChild(navItemAnch);
        document.getElementsByTagName("nav")[0].getElementsByTagName("ul")[0].appendChild(navItem);

        navItemAnch.addEventListener('click', function(evt) {
            evt.preventDefault();
            $('html, body').animate({
                scrollTop: $("#heading-" + folderList.replace('/', '')).offset().top - 120
            }, 250);
        }, false);

    }

    var isCompactView = false,
        isCaptureMode = false,
        isZoomedOut = false;

    var navList = document.getElementsByTagName("nav")[0].getElementsByTagName("ul")[0];

    var h2Tags = document.getElementsByTagName("h2");
    var controlButtons = document.getElementsByClassName("control-section");

    var iFrameTags = document.getElementsByTagName("iframe");
    var iFrameWrappers = document.getElementsByClassName("iframe-wrapper");

    function compactViewToggle(evt) {

        evt.preventDefault();

        if (isCompactView == false) {
            for (var i = 0; i < h2Tags.length; i++) {
                navList.style.display = "none";

                h2Tags[i].style.display = "none";
                controlButtons[i].style.display = "none";
                iFrameWrappers[i].style.paddingBottom = "0px";
            }
            document.getElementById("compactViewToggle").innerHTML = "View on <strong>Standard</strong>";
            isCompactView = true;

        } else {
            for (var i = 0; i < h2Tags.length; i++) {
                navList.style.display = "";

                h2Tags[i].style.display = "";
                controlButtons[i].style.display = "";
                iFrameWrappers[i].style.paddingBottom = "";
            }
            document.getElementById("compactViewToggle").innerHTML = "View on <strong>Compact</strong>";
            isCompactView = false;
        }

    }

    function showLastFrame(evt) {

        evt.preventDefault();

        for (var i = 0; i < h2Tags.length; i++) {
            if (typeof iFrameTags[i].contentWindow.Animation !== typeof undefined) {
                iFrameTags[i].contentWindow.Animation.mainTimeline.pause(30);
            }
        }

    }

    function zoomOutToggle(evt) {

        evt.preventDefault();

        if (isZoomedOut == false) {
            for (var i = 0; i < iFrameTags.length; i++) {


                iFrameTags[i].setAttribute('class', "zoom-out");
                iFrameWrappers[i].style.width = iFrameTags[i].offsetWidth * 0.5 + "px";
                iFrameWrappers[i].style.height = iFrameTags[i].offsetHeight * 0.5 + "px";
            }
            document.getElementById("zoomOutToggle").innerHTML = "Zoom on <strong>1.0x</strong>";
            isZoomedOut = true;

        } else {
            for (var i = 0; i < iFrameTags.length; i++) {
                iFrameTags[i].setAttribute('class', " ");
                iFrameWrappers[i].style.width = iFrameTags[i].offsetWidth * 1 + "px";
                iFrameWrappers[i].style.height = iFrameTags[i].offsetHeight * 1 + "px";
            }
            document.getElementById("zoomOutToggle").innerHTML = "Zoom on <strong>0.5x</strong>";
            isZoomedOut = false;
        }
    }

    function screenshotSelected(elemNum) {

        html2canvas(iFrameTags[elemNum].contentWindow.document.body, {
            onrendered: function(canvas) {

                var img = canvas.toDataURL("image/png");

                $("<a>", {
                        href: img,
                        download: "backup_" + folderList[elemNum].replace('/', '')
                    })
                    .on("click", function() {
                        $(this).remove()
                    })
                    .appendTo("body")[0]
                    .click()
            },
            width: width[elemNum],
            height: height[elemNum]
        });
    }

    function screenshotAll(evt) {
        evt.preventDefault();
        for (var i = 0; i < iFrameTags.length; i++) {
            screenshotSelected(i);

        }

    }

    function addSliderOnClick(elemNum) {
        document.getElementById("slider-" + folderList[elemNum].replace('/', '')).style.display = "inline-block";
        sliderArray[elemNum] = new GSAPTLSlider(iFrameTags[elemNum].contentWindow.Animation.mainTimeline, "slider-" + folderList[elemNum].replace('/', ''), {});
        document.getElementById("slider-" + folderList[elemNum].replace('/', '')).style.width = "225px";
        isSliderOn[elemNum] = true;
    }

    function removeSliderOnClick(elemNum) {
        sliderArray[elemNum].clear()
        isSliderOn[elemNum] = false;
        document.getElementById("slider-" + folderList[elemNum].replace('/', '')).style.width = 0;
    }

    function iFrameAnimationLoaded(creativeName) {

        document.getElementById("control-section-" + creativeName).setAttribute('class', "control-section");

        //Add Slider
        var elemNum = parseInt(document.getElementById(creativeName).getAttribute('elemnum'));

        document.getElementById("slider-" + folderList[elemNum].replace('/', '')).style.display = "inline-block";
        sliderArray[elemNum] = new GSAPTLSlider(iFrameTags[elemNum].contentWindow.Animation.mainTimeline, "slider-" + folderList[elemNum].replace('/', ''), {});
        document.getElementById("slider-" + folderList[elemNum].replace('/', '')).style.width = "225px";
        isSliderOn[elemNum] = true;


    }
    </script>
    <script src="http://localhost:4014/livereload.js"></script>
</body>

</html>
