
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
#bg3 {
  width: $bannerWidth;
  height: $bannerHeight;
}

#bg1 {
  background: olive;
}

#bg2 {
  background: grey;
}

#product {
  right: 40px;
  bottom: 16px;
}

#cta {
  right: 50px;
  bottom: 10px;
}

#logo {
  right: 50px;
  bottom: 46px;
}
.copy {
    font-size: 20px;
    padding: 10px;
}