
$bannerWidth: <%= width %>px;
$bannerHeight: <%= height %>px;
@import '../shared/sass/_base';
@import '../shared/sass/_reset';
@import '../shared/sass/_font';

/*============================
=            Main            =
============================*/

#bg1,
#bg2,
#bg3,
#bg4, {
  width: $bannerWidth;
  height: $bannerHeight;
}

#bg1 {
  background: crimson;
}

#bg2 {
  background: orange;
}

#bg3 {
  background: dodgerblue;
}
#bg4 {
  background: #444;
}

#product {
  left: 10px;
  top: 10px;
}

#cta {
  right: 5px;
  bottom: 5px;
}

#logo {
  right: 5px;
  bottom: 44px;
}
.copy {
    font-size: 20px;
    padding: 10px;
    color: white;
}