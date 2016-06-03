<!DOCTYPE html>
<html>

<head>
  <title><%= jobnumber %> Preview</title>

  <style type="text/css">
  	body {
  		font-family: Arial, san-serif;
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
 		font-weight: bold;
  	font-size: 22px;
  	color: red;
  	}
  </style>

</head>
<body>
		<h1><%= jobnumber %> Preview</h1>
<p>!! IMPORTANT - Turn off your Ad Blocker !!</p>
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

	</script>

		<script src="http://localhost:4014/livereload.js"></script>
</body>

</html>
