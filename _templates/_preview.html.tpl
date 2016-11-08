<!DOCTYPE html>
<html>

<head>
    <title>
        <%= jobnumber %> Preview</title>
    <style type="text/css">
    body {
        font-family: Arial, san-serif;
        padding-bottom: 80px;
    }
    
    * {
        margin: 0;
        padding: 0;
        text-align: center;
    }
    
    h1 {
        padding: 30px 0;
        background-color: black;
        color: white;
    }
    
    h2 {
        padding: 20px 0;
    }
    
    a {}
    
    ul {
        list-style-type: none;
        position: fixed;
        top: 4px;
        left: 4px;
        -moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
        -webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
        box-shadow: inset 0px 1px 0px 0px #ffffff;
        background-color: #f9f9f9;
        -moz-border-radius: 6px;
        -webkit-border-radius: 6px;
        border-radius: 6px;
        border: 1px solid #dcdcdc;
        color: #666666;
        font-family: Arial;
        font-size: 10px;
        padding: 4px;
        text-decoration: none;
    }
    
    li:nth-child(1) {
        font-weight: bold;
        font-size: 12px;
        padding: 4px 8px;
    }
    
    li {
        padding: 4px 4px;
        text-align: left;
    }
    
    li a {
        text-decoration: none;
        color: #666666;
        padding: 4px 4px;
    }
    
    li a:hover {
        color: white;
        background-color: #666666;
    }
    
    .button {
        -moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
        -webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
        box-shadow: inset 0px 1px 0px 0px #ffffff;
        background-color: #f9f9f9;
        -moz-border-radius: 6px;
        -webkit-border-radius: 6px;
        border-radius: 6px;
        border: 1px solid #dcdcdc;
        display: inline-block;
        cursor: pointer;
        color: #666666;
        font-family: Arial;
        font-size: 12px;
        font-weight: bold;
        padding: 6px 18px;
        text-decoration: none;
        text-shadow: 0px 1px 0px #ffffff;
        margin: 8px 0;
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
        padding-bottom: 26px;
        margin-left: auto;
        margin-right: auto;
        outline: 1px solid transparent;
    }
    
    p {
        font-size: 22px;
        line-height: 140%;
        padding: 20px;
    }
    
    #warning {
        font-weight: bold;
        color: red;
        background-color: black;
        display: none;
    }
    
    .zoom-out {
        transform: scale(0.5);
        transform-origin: 0% 0%;
        width: 200%;
    }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
    <script src='https://s0.2mdn.net/ads/studio/Enabler.js'></script>
    <script>


    </script>
</head>

<body>
    <h1><%= jobnumber %> Preview</h1>
    <a class="button" href="#" id="captureModeToggle" onclick="captureModeToggle()">Enable Backup GIF capture view</a>
    <a class="button" href="#" id="zoomOutToggle" onclick="zoomOutToggle()">X 0.5 Zoom</a>
    <a class="button" href="#" onclick="genarateBackupGIF()">Generate Backup GIF</a>
    <p>
        <%= description %>
    </p>
    <p id="warning">Turn off your Ad Blocker </p>
    <ul>
        <li>Navigation</li>
    </ul>
    <div id="main"></div>
    <script>
    var main = document.getElementById("main");

    if (typeof Enabler == typeof undefined) {
        document.getElementById("warning").style.display = "block";
    }
    var foldername = "<%=foldername%>".split(","),
        width = "<%=width%>".split(","),
        height = "<%=height%>".split(",");

    for (var i = 0; i < foldername.length; i++) {
        prepareFrame(foldername[i], width[i], height[i]);
    }

    function prepareFrame(foldername, width, height) {
        var subheading = document.createElement("h2");
        subheading.innerHTML = foldername;
        main.appendChild(subheading);

        var anch = document.createElement("a");
        anch.innerHTML = "&bull; Seperate View";
        anch.setAttribute('href', foldername);
        main.appendChild(anch);
        anch.className += " button view-seperate";

        var capt = document.createElement("a");
        capt.innerHTML = "&bull; screenshot";
        capt.setAttribute('href', "#");
        main.appendChild(capt);
        capt.className += " button screenshot";

        var ifrm = document.createElement("iframe");
        ifrm.setAttribute("src", foldername + "index.html");
        ifrm.setAttribute("id", foldername);
        ifrm.style.width = width + "px";
        ifrm.style.height = height + "px";
        main.appendChild(ifrm);

        var listItem = document.createElement("li");
        var listItemAnch = document.createElement("a");
        listItemAnch.innerHTML = foldername;
        listItemAnch.setAttribute('href', "#" + foldername);
        listItem.appendChild(listItemAnch);
        document.getElementsByTagName("ul")[0].appendChild(listItem);

    }

    var isCaptureMode = false,
        isZoomedOut = false;

    var navList = document.getElementsByTagName("ul")[0];
    var pageHeader = document.getElementsByTagName("h1")[0];

    var h2Tags = document.getElementsByTagName("h2");
    var viewSeperateBtns = document.getElementsByClassName("view-seperate");
    var screenshotBtns = document.getElementsByClassName("screenshot");
    var iFrameTags = document.getElementsByTagName("iframe");

    function captureModeToggle() {

        if (isCaptureMode == false) {
            for (var i = 0; i < h2Tags.length; i++) {
                navList.style.display = "none";
                pageHeader.style.display = "none";
                h2Tags[i].style.display = "none";
                viewSeperateBtns[i].style.display = "none";
                iFrameTags[i].style.display = "inline-block";
                iFrameTags[i].style.paddingBottom = "0px";
                if (typeof iFrameTags[i].contentWindow.Animation !== typeof undefined)
                    iFrameTags[i].contentWindow.Animation.mainTimeline.pause(30);
            }
            document.getElementById("captureModeToggle").innerHTML = "Disable Backup GIF capture mode";
            isCaptureMode = true;

        } else {
            for (var i = 0; i < h2Tags.length; i++) {
                navList.style.display = "";
                pageHeader.style.display = "";
                h2Tags[i].style.display = "";
                viewSeperateBtns[i].style.display = "";
                iFrameTags[i].style.display = "";
                iFrameTags[i].style.paddingBottom = "";
            }   
            document.getElementById("captureModeToggle").innerHTML = "Enable Backup GIF capture mode";
            isCaptureMode = false;
        }

    }

    function zoomOutToggle() {
        if (isZoomedOut == false) {
            main.setAttribute('class', "zoom-out");
            document.getElementById("zoomOutToggle").innerHTML = "X 1.0 Zoom";
            isZoomedOut = true;
        } else {
            main.setAttribute('class', " ");
            document.getElementById("zoomOutToggle").innerHTML = "X 0.5 Zoom";
            isZoomedOut = false;
        }
    }
    function genarateBackupGIF(elemNum) {
    //    iframe2image(iFrameTags[0]);


        html2canvas(iFrameTags[elemNum], {
          onrendered: function(canvas) {
            document.body.appendChild(canvas);
          },
          width: width[elemNum],
          height: height[elemNum]
        });


    }


    </script>
    <script src="http://localhost:4014/livereload.js"></script>
</body>

</html>
