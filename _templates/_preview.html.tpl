<!DOCTYPE html>
<html>

<head>
    <title>
        <%= jobnumber %> Preview</title>
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
        background-color: black;
        padding: 30px;
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
        top: 4px;
        left: 4px;
    }
    
    nav ul {
        -moz-border-radius: 20px;
        -webkit-border-radius: 20px;
        border-radius: 20px;
        border: 0;
        list-style-type: none;
        background-color: #303030;
        color: #DDD;
        font-size: 11px;
        padding: 2px;
        text-decoration: none;
        max-height: 34px;
        max-width: 34px;
        overflow: hidden;

        transition: border-radius 0.1s linear 0.1s, max-height 0.1s linear, max-width 0.1s linear 0.1s, background-color 0.2s linear;
    }
    
    nav ul:hover {
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;

        max-height: 1400px;
        max-width: 240px;
        border: 0;
        background-color: #e6e6e6;
        color: #333;

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
    }
    
    nav ul li:nth-child(1) a i:nth-child(1) {
        padding-right: 6px;
        padding-bottom: 10px;
    }
    
    nav ul li:nth-child(1) a i:nth-child(2) {
        padding-left: 6px;
        padding-bottom: 10px;
    }
    
    nav ul li:last-child {
        margin-bottom: 10px;
    }
    
    nav ul .nav-item {}
    
    nav ul .nav-item:hover {
        background-color: #c0c0c0;
    }
    
    nav ul .nav-item:hover a {
        color: black;
    }
    /* Old-style button*/
    
    .button-old {
        -moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
        -webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
        box-shadow: inset 0px 1px 0px 0px #ffffff;
        background-color: #f9f9f9;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        border-radius: 3px;
        border: 1px solid #dcdcdc;
        display: inline-block;
        cursor: pointer;
        color: #666;
        font-size: 10px;
        padding: 4px 8px;
        text-decoration: none;
        text-shadow: 0px 1px 0px #ffffff;
        margin: 8px 4px;
    }
    
    .button-old:hover {
        background-color: #e9e9e9;
    }
    
    .button-old:active {
        position: relative;
        top: 1px;
    }
    /* Simple button*/
    
    .button {
        background-color: #e6e6e6;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        border: 0;
        display: inline-block;
        cursor: pointer;
        color: #666;
        font-size: 11px;
        padding: 6px 10px;
        text-decoration: none;
        margin: 8px 3px;
        -moz-transition: all 0.3s ease;
        -webkit-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
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
        display: none;
        cursor: pointer;
        padding-top: 0px;
        user-select: none;
        margin-left: 4px;
    }
    
    .slider-section div:nth-child(2) {
        /* rail */
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        border: 1px solid #dcdcdc;
        height: 5px !important;
        background-color: #666 !important;
        margin: 0 !important;
    }
    
    .slider-section div:nth-child(3) {
        /* thumb */
        -moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
        -webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
        box-shadow: inset 0px 1px 0px 0px #ffffff;
        background-color: #f9f9f9;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        border: 1px solid #dcdcdc;
        display: inline-block;
        color: #666;
    }
    .iframe-wrapper {
        padding-bottom: 36px;
        margin: 0 auto;
        transition: all 0.2s ease;

    }

    iframe {
        border: none;
        display: block;
        transition: all 0.2s ease;

    }
    
    #warning {
        color: white;
        background-color: crimson;
        padding: 20px 0;
        display: none;
    }
    
    .zoom-out {
        transform: scale(0.5);
        transform-origin: 0% 0%;

    }
    
    #previewmode-buttons {
        padding: 20px;
        background-color: black;
        margin-bottom: 30px;
    }
    
    #previewmode-buttons ul {
        list-style: none;
        padding: 0;
        background: #eee;
        -moz-border-radius: 2px;
        -webkit-border-radius: 2px;
        border-radius: 2px;
        border: 0;
        width: 300px;
        display: inline-block;
        margin: 0 auto;
    }
    
    #previewmode-buttons ul li {
        box-sizing: border-box;
        display: block;
        width: 100px;
        float: left;

        border-right: 1px solid rgba(0, 0, 0, 0.3);
        border-left: 1px solid rgba(255, 255, 255, 0.3);

        -moz-transition: all 0.3s ease;
        -webkit-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }
    
    #previewmode-buttons ul li:hover {
        background-color: #0078e7;
    }
    
    #previewmode-buttons ul li:hover a,
    #previewmode-buttons ul li:hover a strong {
        color: white;
        -moz-transition: all 0.3s ease;
        -webkit-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }
    

    #previewmode-buttons ul li:first-child {
        -moz-border-radius: 2px 0 0 2px;
        -webkit-border-radius: 2px 0 0 2px;
        border-radius: 2px 0 0 2px;
        border-left: none;

    }
    
    #previewmode-buttons ul li:last-child {
        -moz-border-radius: 0 2px 2px 0;
        -webkit-border-radius: 0 2px 2px 0;
        border-radius: 0 2px 2px 0;
        border-right: none;

    }
    
    #previewmode-buttons ul a {
        line-height: 1;
        font-size: 12px;
        color: #999;
        display: block;
        text-align: center;
        padding: 8px 0;
        font-weight: 400;
        text-decoration: none;
    }
    
    #previewmode-buttons ul a strong {
        font-size: 15px;
        display: block;
        color: #222;
        font-weight: 700;
        padding-top: 3px;
    }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/9fbee15718.js"></script>
    <script src='https://s0.2mdn.net/ads/studio/Enabler.js'></script>
    <script src="html2canvas.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js"></script>
    <script src="gsap-timeline-slider.js"></script>
</head>

<body>
    <header id="header">
        <div class="header-logo" style="width: 48px; height: 48px; position: relative; margin: 0 auto;">
            <!-- Generator: Adobe Illustrator 18.1.1, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
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
        <h1><%= jobnumber %></h1>
        <p>
            <%= description %>
        </p>
        <p id="warning">Turn off the Ad blocker </p>
        <nav>
            <ul>
                <li><a id="scroll-to-top" href="#"><i class="fa fa-bars" aria-hidden="true"></i> Scroll to Top <i class="fa fa-caret-up" aria-hidden="true"></i></a></li>
            </ul>
        </nav>
    </header>
    <section id="previewmode-buttons">
        <ul>
            <li><a href="#" id="compactViewToggle" onclick="compactViewToggle(event)">View on <strong>Compact</strong></a></li>
            <li><a href="#" id="showLastFrame" onclick="showLastFrame(event)">Set all to <strong>End Frame</strong></a></li>
            <li><a href="#" id="zoomOutToggle" onclick="zoomOutToggle(event)">Zoom on <strong>0.5x</strong></a></li>
        </ul>
    </section>
    <section id="main"></section>
    <script>
    var main = document.getElementById("main");

    if (typeof Enabler == typeof undefined) {
        document.getElementById("warning").style.display = "block";
    }
    var foldername = "<%=foldername%>".split(","),
        width = "<%=width%>".split(","),
        height = "<%=height%>".split(",");

    var sliderArray = new Array(foldername.length);
    var isSliderOn = new Array(foldername.length);

    for (var i = 0; i < foldername.length; i++) {
        isSliderOn[i] = false;

        preparePreview(foldername[i], width[i], height[i], i);
    }


    document.getElementById("scroll-to-top").addEventListener('click', function(evt) {
        evt.preventDefault();
        $('html, body').animate({
            scrollTop: $("#header").offset().top
        }, 250);
    }, false);

    function preparePreview(foldername, width, height, i) {
        var subheading = document.createElement("h2");
        subheading.innerHTML = foldername.replace('/', '');
        subheading.setAttribute('id', "heading-" + foldername.replace('/', ''));
        main.appendChild(subheading);

        var controlSection = document.createElement("section");
        controlSection.setAttribute('class', "control-section");
        main.appendChild(controlSection);

        //
        var anch = document.createElement("a");
        anch.innerHTML = '<i class="fa fa-external-link-square" aria-hidden="true"></i> Open in new tab';
        anch.setAttribute('title', "Open this banner in a new tab");
        anch.setAttribute('href', foldername);
        anch.setAttribute('target', '_blank');
        anch.className += " button long";
        controlSection.appendChild(anch);

        var capt = document.createElement("a");
        capt.innerHTML = '<i class="fa fa-camera" aria-hidden="true"></i> Screenshot';
        capt.setAttribute('title', "Take a screenshot");
        capt.setAttribute('href', "#");
        capt.className += " button long";
        capt.addEventListener('click', function(evt) {
            evt.preventDefault();
            genarateBackupGIF(i);
        }, false);
        controlSection.appendChild(capt);

        //Rewind Button
        var bannerRewind = document.createElement("a");
        bannerRewind.innerHTML = '<i class="fa fa-fast-backward" aria-hidden="true"></i>';
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

        //Pause Button
        var bannerPause = document.createElement("a");
        bannerPause.innerHTML = '<i class="fa fa-pause" aria-hidden="true"></i>';
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
        bannerPlay.innerHTML = '<i class="fa fa-play" aria-hidden="true"></i>';
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

        //
        //Timeline Slider
        var sliderSection = document.createElement("section");
        sliderSection.setAttribute('id', "slider-" + foldername.replace('/', ''));
        sliderSection.setAttribute('class', "slider-section");

        controlSection.appendChild(sliderSection);
        //

        //Slider Button
        var bannerSlider = document.createElement("a");
        bannerSlider.innerHTML = '<i class="fa fa-sliders" aria-hidden="true"></i> Toggle slider';
        bannerSlider.setAttribute('title', "Toggle Slider");
        bannerSlider.setAttribute('href', "#");
        bannerSlider.className += " button long";

        bannerSlider.addEventListener('click', function(evt) {
            evt.preventDefault();
            if (typeof iFrameTags[i].contentWindow.Animation !== typeof undefined) {
                if (isSliderOn[i] != true)
                    addSlider(i);
                else
                    removeSlider(i);
            }
        }, false);
        controlSection.appendChild(bannerSlider);

        //

        var ifrmWrapper  = document.createElement("div");
        ifrmWrapper.setAttribute("class", "iframe-wrapper");
        ifrmWrapper.style.width = width + "px";
        ifrmWrapper.style.height = height + "px";
        main.appendChild(ifrmWrapper);

        var ifrm = document.createElement("iframe");
        ifrm.setAttribute("src", foldername + "index.html");
        ifrm.setAttribute("id", foldername.replace('/', ''));
        ifrm.style.width = width + "px";
        ifrm.style.height = height + "px";
        ifrmWrapper.appendChild(ifrm);

        var navItem = document.createElement("li");
        navItem.setAttribute('class', "nav-item");
        var navItemAnch = document.createElement("a");
        navItemAnch.innerHTML = foldername.replace('/', '');
        navItemAnch.setAttribute('href', "#");
        navItem.appendChild(navItemAnch);
        document.getElementsByTagName("nav")[0].getElementsByTagName("ul")[0].appendChild(navItem);

        navItemAnch.addEventListener('click', function(evt) {
            evt.preventDefault();
            $('html, body').animate({
                scrollTop: $("#heading-" + foldername.replace('/', '')).offset().top
            }, 250);
        }, false);

    }

    var isCompactView = false,
        isCaptureMode = false,
        isZoomedOut = false;

    var navList = document.getElementsByTagName("nav")[0].getElementsByTagName("ul")[0];
    var pageHeader = document.getElementsByTagName("header")[0];

    var h2Tags = document.getElementsByTagName("h2");
    var controlButtons = document.getElementsByClassName("control-section");

    var iFrameTags = document.getElementsByTagName("iframe");
    var iFrameWrappers = document.getElementsByClassName("iframe-wrapper");


    function compactViewToggle(evt) {

        evt.preventDefault();

        if (isCompactView == false) {
            for (var i = 0; i < h2Tags.length; i++) {
                navList.style.display = "none";
                pageHeader.style.display = "none";
                h2Tags[i].style.display = "none";
                controlButtons[i].style.display = "none";
                iFrameWrappers[i].style.display = "inline-block";
                iFrameWrappers[i].style.paddingBottom = "0px";
            }
            document.getElementById("compactViewToggle").innerHTML = "View on <strong>Standard</strong>";
            isCompactView = true;

        } else {
            for (var i = 0; i < h2Tags.length; i++) {
                navList.style.display = "";
                pageHeader.style.display = "";
                h2Tags[i].style.display = "";
                controlButtons[i].style.display = "";
                iFrameWrappers[i].style.display = "";
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

    function genarateBackupGIF(elemNum) {

        html2canvas(iFrameTags[elemNum].contentWindow.document.body, {
            onrendered: function(canvas) {

                var img = canvas.toDataURL("image/png");

                $("<a>", {
                        href: img,
                        download: "backup_" + foldername[elemNum].replace('/', '')
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

    function addSlider(elemNum) {

        document.getElementById("slider-" + foldername[elemNum].replace('/', '')).style.display = "inline-block";
        sliderArray[elemNum] = new GSAPTLSlider(iFrameTags[elemNum].contentWindow.Animation.mainTimeline, "slider-" + foldername[elemNum].replace('/', ''), {
            button: {
                display: "none"
            },
            container: {

            },
            thumb: {
                width: "6px",
                height: "13px",
                padding: "0px",
                margin: "0px",
                "margin-left": "-5px",
                top: "5px",
                "vertical-align": "top",
                position: "relative"

            },
            width: 200
        });
        isSliderOn[elemNum] = true;
    }

    function removeSlider(elemNum) {

        document.getElementById("slider-" + foldername[elemNum].replace('/', '')).style.display = "none";

        sliderArray[elemNum].clear()
        isSliderOn[elemNum] = false;
    }
    </script>
    <script src="http://localhost:4014/livereload.js"></script>
</body>

</html>
