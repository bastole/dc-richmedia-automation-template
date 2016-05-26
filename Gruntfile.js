'use strict';
var config = require('./config.json');
var _ = require('underscore');
_.str = require('underscore.string');

// Mix in non-conflict functions to Underscore namespace if you want
_.mixin(_.str.exports());

var
  LIVERELOAD_HOST = "localhost",
  LIVERELOAD_PORT = 4000,
  BANNER_LIST = ["300x250/", "300x600/", "728x90/", "160x600/"],
  SRC = "build/",
  DEST = "public/",
  JS_PARTIAL = "template/js-partial/",

  FOLDER_LIST = [];

for (var i = 0; i < config.list.length; i++) {
  for (var j = 0; j < config.list[i].dimension.length; j++) {
    FOLDER_LIST.push(config.jobnumber.concat("_", config.list[i].creative, "_", config.list[i].dimension[j], "/"));
  }
}

console.log(FOLDER_LIST);
var uglifyFiles = [],
sassFiles = [],
copyFiles = [];

for (var i = 0; i < FOLDER_LIST.length; i++) {
  uglifyFiles[i] = {
    src : [JS_PARTIAL.concat("base.js"), JS_PARTIAL.concat("pre-loader.js"), SRC.concat(FOLDER_LIST[i], "animate.js")],
    dest : DEST.concat(FOLDER_LIST[i], "main.js")
  };
  sassFiles[i] = {
    src : SRC.concat(FOLDER_LIST[i], "main.scss"),
    dest : DEST.concat(FOLDER_LIST[i], "style.scss")
  };
  copyFiles[i] = {
    src : [JS_PARTIAL.concat("base.js"), JS_PARTIAL.concat("pre-loader.js"), SRC.concat(FOLDER_LIST[i], "animate.js")],
    dest : DEST.concat(FOLDER_LIST[i], "main.js")
  };

}



module.exports = function(grunt) {

  // load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);


  grunt.initConfig({

    mkdir: {
      setUp: {
        options: {
          create: FOLDER_LIST.map(function(a){return SRC.concat(a)})
        }
      }
    },

    clean: {
      all: {
        src: "public/**.{html,js,css}"
      }
    },

    jshint: {
      all: {
        src: "build/**.js"
      }
    },

    uglify: {
      all: {
          files: uglifyFiles
/*        src: [JS_PARTIAL + "base.js", JS_PARTIAL + "pre-loader.js", SRC + BANNER_LIST[0] + "animate.js"],
        dest: DEST + BANNER_LIST[0] + "main.js"
*/      }
    },

    sass: {
      options: {
        sourcemap: "none"
      },
      all: {
          files: sassFiles
/*        src: SRC + BANNER_LIST[0] + "main.scss",
        dest: DEST + BANNER_LIST[0] + "style.css"
*/
      }

    },

    imagemin: {
      all: {
        expand: true,
        cwd: SRC + BANNER_LIST[0] + "images/",
        src: "*.{jpg,png,gif,svg}",
        dest: DEST + BANNER_LIST[0]

      }
    },

    copy: {
      setUp: {

      },

      html: {
        expand: true,
        cwd: SRC + BANNER_LIST[0],
        src: ["*.html"],
        dest: DEST + BANNER_LIST[0]
      },
      js: {
        expand: true,
        cwd: SRC + BANNER_LIST[0] + "js",
        src: ["init.js"],
        dest: DEST + BANNER_LIST[0]
      },
      video: {
        expand: true,
        cwd: SRC + BANNER_LIST[0] + "video",
        src: "*.{mp4, ogg, ogv, webm}",
        dest: DEST + BANNER_LIST[0]
      },
      backup: {
        expand: true,
        cwd: SRC + BANNER_LIST[0] + "backup",
        src: "*.{jpg,gif,png}",
        dest: DEST + BANNER_LIST[0]
      }
    },
    size_report: {
      your_target: {
        files: {
          list: [DEST + "*"]
        },
      },
    },
    watch: {
      options: {
        livereload: {
          host: LIVERELOAD_HOST,
          port: LIVERELOAD_PORT
        }
      },
      code: {
        files: ["build/**/*.html", "build/**/*.js", "build/**/*.css", "build/**/*.scss"],
        tasks: ["jshint", "clean", "uglify", "sass", "copy", "size_report"]
      },
      image: {
        files: ["build/images/**/*.jpg", "build/images/**/*.png", "build/images/**/*.gif", "build/images/**/*.svg"],
        tasks: ["imagemin", "size_report"]
      }
    }

  });

  grunt.registerTask("default", ["jshint", "clean", "uglify", "sass", "imagemin", "copy", "size_report", "watch"]);

};
