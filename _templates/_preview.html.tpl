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
    
    nav ul {
        list-style-type: none;
        position: fixed;
        top: 4px;
        left: 4px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        border-radius: 3px;
        border: 1px solid #444;
        background-color: #222;
        color: #CCC;
        font-size: 9px;
        padding: 2px;
        text-decoration: none;
        max-height: 26px;
        max-width: 92px;
        overflow-y: hidden;
        -moz-transition: max-height 0.1s linear, max-width 0.1s linear 0.1s, background-color 0.2s linear;
        -webkit-transition: max-height 0.1s linear, max-width 0.1s linear 0.1s, background-color 0.2s linear;
        -o-transition: max-height 0.1s linear, max-width 0.1s linear 0.1s, background-color 0.2s linear;
        transition: max-height 0.1s linear, max-width 0.1s linear 0.1s, background-color 0.2s linear;
    }
    
    nav ul:hover {
        max-height: 1400px;
        max-width: 220px;
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
        color: #666;
        padding: 4px 0;
    }
    
    nav ul li:nth-child(1) {
        font-size: 12px;
        margin-bottom: 6px;
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
        font-size: 12px;
        padding: 6px 12px;
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
    <script src='https://s0.2mdn.net/ads/studio/Enabler.js'></script>
    <script src="html2canvas.js"></script>
</head>

<body>
    <header id="header">
        <h1><%= jobnumber %></h1>
        <p>
            <%= description %>
        </p>
        <p id="warning">Turn off the Ad blocker </p>
        <nav>
            <ul>
                <li><a href="#header">Navigation &#9662; </a></li>
            </ul>
        </nav>
    </header>
    <section id="previewmode-buttons">
        <ul>
            <li><a href="#" id="compactViewToggle" onclick="compactViewToggle()">View on <strong>Compact</strong></a></li>
            <li><a href="#" id="showLastFrame" onclick="showLastFrame()">Jump to <strong>End frame</strong></a></li>
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
        prepareFrame(foldername[i], width[i], height[i],i);
    }

    function prepareFrame(foldername, width, height,i) {
        var subheading = document.createElement("h2");

        subheading.innerHTML = foldername.replace('/', '');
        subheading.setAttribute('id', "heading-" + foldername.replace('/', ''));
        main.appendChild(subheading);
        var anch = document.createElement("a");
        anch.innerHTML = "Seperate View";
        anch.setAttribute('href', foldername);
        anch.className += " button view-seperate";
        main.appendChild(anch);
        var capt = document.createElement("a");
        capt.innerHTML = "Take Screenshot";
        capt.setAttribute('href', "#");
        capt.className += " button screenshot";

        capt.addEventListener('click', function(evt) {
            evt.preventDefault();

            genarateBackupGIF(i);

        }, false);

        main.appendChild(capt);

        var ifrm = document.createElement("iframe");
        ifrm.setAttribute("src", foldername + "index.html");
        ifrm.setAttribute("id", foldername.replace('/', ''));
        ifrm.style.width = width + "px";
        ifrm.style.height = height + "px";
        main.appendChild(ifrm);

        var listItem = document.createElement("li");
        listItem.setAttribute('class', "nav-item");
        var listItemAnch = document.createElement("a");
        listItemAnch.innerHTML = foldername;
        listItemAnch.setAttribute('href', "#");
        listItem.appendChild(listItemAnch);
        document.getElementsByTagName("nav")[0].getElementsByTagName("ul")[0].appendChild(listItem);


        listItemAnch.addEventListener('click', function(evt) {
            evt.preventDefault();

            console.log("#heading-" + foldername.replace('/', ''));
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
    var viewSeperateBtns = document.getElementsByClassName("view-seperate");
    var screenshotBtns = document.getElementsByClassName("screenshot");
    var iFrameTags = document.getElementsByTagName("iframe");

    function compactViewToggle() {

        if (isCompactView == false) {
            for (var i = 0; i < h2Tags.length; i++) {
                navList.style.display = "none";
                pageHeader.style.display = "none";
                h2Tags[i].style.display = "none";
                viewSeperateBtns[i].style.display = "none";
                screenshotBtns[i].style.display = "none";
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
                viewSeperateBtns[i].style.display = "";
                screenshotBtns[i].style.display = "";
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
