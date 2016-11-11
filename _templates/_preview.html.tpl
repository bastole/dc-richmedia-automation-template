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
        list-style-type: none;

        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        border-radius: 3px;
        border: 1px solid #444;
        background-color: #222;
        color: #DDD;
        font-size: 9px;
        padding: 2px;
        text-decoration: none;
        max-height: 26px;
        max-width: 34px;
        overflow: hidden;
        -moz-transition: max-height 0.1s linear, max-width 0.1s linear 0.1s, background-color 0.2s linear;
        -webkit-transition: max-height 0.1s linear, max-width 0.1s linear 0.1s, background-color 0.2s linear;
        -o-transition: max-height 0.1s linear, max-width 0.1s linear 0.1s, background-color 0.2s linear;
        transition: max-height 0.1s linear, max-width 0.1s linear 0.1s, background-color 0.2s linear;
    }
    
    nav ul:hover {
        max-height: 1400px;
        max-width: 220px;
        border: 1px solid #CCC;
        background-color: #f9f9f9;
        color: #333;
        -moz-transition: max-height 1.4s linear 0.2s, max-width 0.2s linear, background-color 0.4s linear;
        -webkit-transition: max-height 1.4s linear 0.2s, max-width 0.2s linear, background-color 0.4s linear;
        -o-transition: max-height 1.4s linear 0.2s, max-width 0.2s linear, background-color 0.4s linear;
        transition: max-height 1.4s linear 0.2s, max-width 0.2s linear, background-color 0.4s linear;
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
        background-color: #DDD;
    }
    
    nav ul .nav-item:hover a {
        color: black;
    }
    
    .button {
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
    
    .button:hover {
        background-color: #e9e9e9;
    }
    
    .button:active {
        position: relative;
        top: 1px;
    }
    .button.long i {
        padding-right: 4px;
    }

    iframe {
        border: none;
        display: block;
        padding-bottom: 36px;
        margin-left: auto;
        margin-right: auto;
        outline: 1px solid transparent;
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
        width: 200%;
    }
    
    #previewmode-buttons {
        padding: 20px;
        background-color: black;
        margin-bottom: 30px;
    }
    
    #previewmode-buttons ul {
        list-style: none;
        height: 40px;
        padding: 0;
        background: #eee;
        background: -moz-linear-gradient(top, #f8f8f8 0%, #dddddd 100%);
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f8f8f8), color-stop(100%, #dddddd));
        background: -webkit-linear-gradient(top, #f8f8f8 0%, #dddddd 100%);
        background: -o-linear-gradient(top, #f8f8f8 0%, #dddddd 100%);
        background: -ms-linear-gradient(top, #f8f8f8 0%, #dddddd 100%);
        background: linear-gradient(top, #f8f8f8 0%, #dddddd 100%);
        border-radius: 5px;
        border: 1px solid #d2d2d2;
        box-shadow: inset #fff 0 1px 0, inset rgba(0, 0, 0, 0.03) 0 -1px 0;
        width: 270px;
        display: block;
        margin: 0 auto;
    }
    
    #previewmode-buttons li {
        width: 89px;
        float: left;
        border-right: 1px solid #d2d2d2;
        height: 40px;
    }
    
    #previewmode-buttons li:hover {
        background: #bbb;
        background: -moz-linear-gradient(top, #eeeeee 0%, #cfcfcf 100%);
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #cfcfcf), color-stop(100%, #cfcfcf));
        background: -webkit-linear-gradient(top, #eeeeee 0%, #cfcfcf 100%);
        background: -o-linear-gradient(top, #eeeeee 0%, #cfcfcf 100%);
        background: -ms-linear-gradient(top, #eeeeee 0%, #cfcfcf 100%);
        background: linear-gradient(top, #eeeeee 0%, #cfcfcf 100%);
    }
    
    #previewmode-buttons ul li + li {
        width: 88px;
        border-left: 1px solid #fff;
    }
    
    #previewmode-buttons ul li + li + li {
        width: 89px;
        border-right: none;
    }
    
    #previewmode-buttons ul a {
        line-height: 1;
        font-size: 11px;
        color: #999;
        display: block;
        text-align: center;
        padding-top: 6px;
        height: 34px;
        font-weight: 400;
        text-decoration: none;
    }
    
    #previewmode-buttons ul a strong {
        font-size: 13px;
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
            <li><a href="#" id="compactViewToggle" onclick="compactViewToggle()">View on <strong>Compact</strong></a></li>
            <li><a href="#" id="showLastFrame" onclick="showLastFrame()">Set all to <strong>End Frame</strong></a></li>
            <li><a href="#" id="zoomOutToggle" onclick="zoomOutToggle()">Zoom on <strong>0.5x</strong></a></li>
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

    for (var i = 0; i < foldername.length; i++) {
        preparePreview(foldername[i], width[i], height[i],i);
    }


    document.getElementById("scroll-to-top").addEventListener('click', function(evt) {
        evt.preventDefault();
        $('html, body').animate({
            scrollTop: $("#header").offset().top
        }, 250);
    }, false);

    function preparePreview(foldername, width, height,i) {
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
        anch.className += " button long view-separate";
        controlSection.appendChild(anch);

        var capt = document.createElement("a");
        capt.innerHTML = '<i class="fa fa-camera" aria-hidden="true"></i> Screenshot';
        capt.setAttribute('title', "Take a screenshot");
        capt.setAttribute('href', "#");
        capt.className += " button long screenshot";
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
        bannerRewind.className += " button banner-play-interface";
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
        bannerPause.className += " button banner-play-interface";
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
        bannerPlay.className += " button banner-play-interface";
        bannerPlay.addEventListener('click', function(evt) {
            evt.preventDefault();
            if (typeof iFrameTags[i].contentWindow.Animation !== typeof undefined) {
                iFrameTags[i].contentWindow.Animation.mainTimeline.play();
            }
        }, false);
        controlSection.appendChild(bannerPlay);

//

        var ifrm = document.createElement("iframe");
        ifrm.setAttribute("src", foldername + "index.html");
        ifrm.setAttribute("id", foldername.replace('/', ''));
        ifrm.style.width = width + "px";
        ifrm.style.height = height + "px";
        main.appendChild(ifrm);

        var navItem = document.createElement("li");
        navItem.setAttribute('class', "nav-item");
        var navItemAnch = document.createElement("a");
        navItemAnch.innerHTML = foldername;
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

    function compactViewToggle() {

        if (isCompactView == false) {
            for (var i = 0; i < h2Tags.length; i++) {
                navList.style.display = "none";
                pageHeader.style.display = "none";
                h2Tags[i].style.display = "none";
                controlButtons[i].style.display = "none";
                iFrameTags[i].style.display = "inline-block";
                iFrameTags[i].style.paddingBottom = "0px";
            }
            document.getElementById("compactViewToggle").innerHTML = "View on <strong>Standard</strong>";
            isCompactView = true;

        } else {
            for (var i = 0; i < h2Tags.length; i++) {
                navList.style.display = "";
                pageHeader.style.display = "";
                h2Tags[i].style.display = "";
                controlButtons[i].style.display = "";
                iFrameTags[i].style.display = "";
                iFrameTags[i].style.paddingBottom = "";
            }
            document.getElementById("compactViewToggle").innerHTML = "View on <strong>Compact</strong>";
            isCompactView = false;
        }

    }

    function showLastFrame() {

        for (var i = 0; i < h2Tags.length; i++) {
            if (typeof iFrameTags[i].contentWindow.Animation !== typeof undefined) {
                iFrameTags[i].contentWindow.Animation.mainTimeline.pause(30);
            }
        }

    }

    function zoomOutToggle() {
        if (isZoomedOut == false) {
            main.setAttribute('class', "zoom-out");
            document.getElementById("zoomOutToggle").innerHTML = "Zoom on <strong>1.0x</strong>";
            isZoomedOut = true;
        } else {
            main.setAttribute('class', " ");
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
    </script>
    <script src="http://localhost:4014/livereload.js"></script>
</body>

</html>
