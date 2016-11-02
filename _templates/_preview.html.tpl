<!DOCTYPE html>
<html>

<head>
    <title>
        <%= jobnumber %> Preview</title>
    <style type="text/css">
    body {
        font-family: Arial, san-serif;
        font-size: 0;
        padding-bottom: 80px;
    }
    
    * {
        margin: 0;
        padding: 0;
        text-align: center;
    }
    
    h1 {
        padding: 30px 0;
        font-size: initial;
    }
    
    h2 {
        padding: 20px 0;
        font-size: initial;
    }
    
    a {
        font-size: initial;
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
        font-size: 15px;
        font-weight: bold;
        padding: 8px 24px;
        text-decoration: none;
        text-shadow: 0px 1px 0px #ffffff;
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
    }
    
    p {
        font-size: 22px;
        line-height: 140%;
        padding: 20px;
    }
    
    .warning {
        font-weight: bold;
        color: red;
    }
    
    .seperate-link {
        margin-bottom: 10px;
    }
    </style>
</head>

<body>
    <h1><%= jobnumber %> Preview</h1>
    <p>
        <%= description %>
    </p>
    <a class="button" href="#" id="captureModeToggle" onclick="captureModeToggle()">&bull; Enable Backup GIF capture mode</a>
    <p class="warning">IMPORTANT - Turn off your Ad Blocker </p>
    <script>
    var foldername = "<%=foldername%>".split(","),
        width = "<%=width%>".split(","),
        height = "<%=height%>".split(",");

    for (var i = 0; i < foldername.length; i++) {
        prepareFrame(foldername[i], width[i], height[i]);
    }

    function prepareFrame(foldername, width, height) {
        var subheading = document.createElement("h2");
        subheading.innerHTML = foldername;
        document.body.appendChild(subheading);

        var anch = document.createElement("a");
        anch.innerHTML = "&bull; Seperate View";
        anch.setAttribute('href', foldername);
        document.body.appendChild(anch);

        anch.className += " button seperate-link";

        var ifrm = document.createElement("iframe");
        ifrm.setAttribute("src", foldername + "index.html");
        ifrm.style.width = width + "px";
        ifrm.style.height = height + "px";
        document.body.appendChild(ifrm);
    }

    var isCaptureMode = false;

    function captureModeToggle() {
        var h2Tag = document.getElementsByTagName("h2");
        var aTag = document.getElementsByClassName("seperate-link");
        var iFrameTag = document.getElementsByTagName("iframe");


        if (isCaptureMode == false) {
            for (var i = 0; i < h2Tag.length; i++) {
                h2Tag[i].style.display = "none";
                aTag[i].style.display = "none";
                iFrameTag[i].style.display = "inline-block";
                iFrameTag[i].style.paddingBottom = "0px";
            }
            document.getElementById("captureModeToggle").innerHTML = "Disable Backup GIF capture mode";
            isCaptureMode = true;

        } else {
            for (var i = 0; i < h2Tag.length; i++) {
                h2Tag[i].style.display = "";
                aTag[i].style.display = "";
                iFrameTag[i].style.display = "";
                iFrameTag[i].style.paddingBottom = "";
            }
            document.getElementById("captureModeToggle").innerHTML = "Enable Backup GIF capture mode";
            isCaptureMode = false;
        }

    }
    </script>
    <script src="http://localhost:4014/livereload.js"></script>
</body>

</html>
