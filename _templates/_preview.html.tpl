<!DOCTYPE html>
<html>

<head>
  <title><%= jobnumber %> Preview</title>

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
		}
		h2 {
		  padding: 20px 0;
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
  		padding:20px;
  	}
 		.warning {
 			font-weight: bold;
  		color: red;
  	}
  	button {
  		padding: 10px;
  	}
  </style>

</head>
<body>
	<h1><%= jobnumber %> Preview</h1>
	<p><%= description %></p>
	<button id="captureModeToggle" onclick="captureModeToggle()">&bull; Enable Backup GIF capture mode</button>

	<p class="warning">IMPORTANT - Turn off your Ad Blocker </p>
  <script>
	  var foldername = "<%=foldername%>".split(","),
		width = "<%=width%>".split(","),
		height= "<%=height%>".split(",");

		for(var i = 0; i < foldername.length; i++){
			prepareFrame(foldername[i],width[i],height[i]);
	  }

	  function prepareFrame(foldername,width,height) {
			var subheading = document.createElement("h2");
			subheading.innerHTML = foldername;
	    document.body.appendChild(subheading);

			var anch = document.createElement("a");
			anch.innerHTML = "Seperate View";
			anch.setAttribute('href',foldername);
	    document.body.appendChild(anch);

	    var ifrm = document.createElement("iframe");
	    ifrm.setAttribute("src", foldername+"index.html");
	    ifrm.style.width = width+"px";
	    ifrm.style.height = height+"px";
	    document.body.appendChild(ifrm);
	  }

	  var isCaptureMode = false;
	  
	  function captureModeToggle(){
	  	var h2Tag = document.getElementsByTagName("h2");
	  	var aTag = document.getElementsByTagName("a");
	  	var iFrameTag = document.getElementsByTagName("iframe");


	  	if(isCaptureMode == false){
		  	for(var i = 0; i < h2Tag.length; i++){
					h2Tag[i].style.display = "none";
					aTag[i].style.display = "none";
					iFrameTag[i].style.display = "inline-block";
					iFrameTag[i].style.paddingBottom = "0px";
				}
				document.getElementById("captureModeToggle").innerHTML = "Disable Backup GIF capture mode";
				isCaptureMode = true;

	  	}
	  	else {
		  	for(var i = 0; i < h2Tag.length; i++){
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
