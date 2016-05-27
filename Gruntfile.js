'use strict';
var config = require('./config.json');
var _ = require('underscore');
_.str = require('underscore.string');

// Mix in non-conflict functions to Underscore namespace if you want
_.mixin(_.str.exports());

var
  LIVERELOAD_HOST = "localhost",
  LIVERELOAD_PORT = 4000,
  SRC = "build/",
  DEST = "public/",
  JS_PARTIAL = SRC.concat("shared/js/partial/"),
  TEMPLATE_DEFAULT = "_templates/default/",
  //  OLDBANNER_LIST = ["300x250/", "300x600/", "728x90/", "160x600/"],
  FOLDER_LIST = [],
  SIZE_LIST = [];

for (var i = 0; i < config.list.length; i++) {
  for (var j = 0; j < config.list[i].dimension.length; j++) {
    FOLDER_LIST.push(config.jobnumber.concat("_", config.list[i].creative, "_", config.list[i].dimension[j], "/"));
    SIZE_LIST.push(config.list[i].dimension[j]);

  }
}

config.widthList = SIZE_LIST.map(function(a) {
  return a.match(/(\d+)/g)[0]
});
config.heightList = SIZE_LIST.map(function(a) {
  return a.match(/(\d+)/g)[1]
});

var uglifyFiles = [],
  sassFiles = [],
  copySetUpFiles = [],
  copyBuildFiles = [],
  imageMinFiles = [];

for (var i = 0; i < FOLDER_LIST.length; i++) {
  uglifyFiles[i] = {
    src: [JS_PARTIAL.concat("base.js"), JS_PARTIAL.concat("pre-loader.js"), SRC.concat(FOLDER_LIST[i], "_animate.js")],
    dest: DEST.concat(FOLDER_LIST[i], "main.js")
  };
  sassFiles[i] = {
    src: SRC.concat(FOLDER_LIST[i], "main.scss"),
    dest: DEST.concat(FOLDER_LIST[i], "style.css")
  };
  imageMinFiles[i] = {
    expand: true,
    cwd: SRC.concat(FOLDER_LIST[i], "images/"),
    src: "*.{jpg,png,gif,svg}",
    dest: DEST.concat(FOLDER_LIST[i])
  };

  copySetUpFiles[i] = {
    expand: true,
    cwd: TEMPLATE_DEFAULT,
    src: ["**", "!*.tpl"],
    dest: SRC.concat(FOLDER_LIST[i])
  };

  copyBuildFiles[i] = {
    expand: true,
    cwd: SRC.concat(FOLDER_LIST[i]),
    src: ["*.*", "!*.scss", "!*.psd", "!*.{jpg,png,gif,svg}", "!_animate.js"],
    dest: DEST.concat(FOLDER_LIST[i])
  };

}
console.log(FOLDER_LIST);

console.log(copyBuildFiles);


module.exports = function(grunt) {

  // load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);


  grunt.initConfig({

    mkdir: {
      setUp: {
        options: {
          create: FOLDER_LIST.map(function(a) {
            return SRC.concat(a)
          })
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
      }
    },

    sass: {
      options: {
        sourcemap: "none"
      },
      all: {
        files: sassFiles
      }

    },

    imagemin: {
      all: {
        files: imageMinFiles
      }
    },

    copy: {
      setUp: {
        files: copySetUpFiles
      },
      build: {
        files: copyBuildFiles
      }
    },
    size_report: {
      your_target: {
        files: {
          list: [DEST + "*", SRC+"*"]
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
      codeUpdated: {
        files: ["build/**/*.{html,js,css,scss}"],
        tasks: ["jshint", "clean", "uglify", "sass", "copy:build", "size_report"]
      },
      imageUpdated: {
        files: ["build/**/*.{jpg,png,gif,svg}"],
        tasks: ["imagemin", "size_report"]
      }
    }

  });

  grunt.registerTask("default", ["jshint", "clean", "uglify", "sass", "imagemin", "copy:build", "size_report", "watch"]);

  grunt.registerTask("buildBootstrapper", "builds the bootstrapper file correctly", function() {
    console.log(config);

    for (var i = 0; i < FOLDER_LIST.length; i++) {
      var bootstrapper = grunt.file.read(TEMPLATE_DEFAULT.concat("_main.scss.tpl"));
      bootstrapper = grunt.template.process(bootstrapper, { data: { width: config.widthList[i], height: config.heightList[i] } });
      grunt.file.write(SRC.concat(FOLDER_LIST[i], "main.scss"), bootstrapper);
    }

  });

  grunt.registerTask("setUp", ["buildBootstrapper", "copy:setUp"]);



};
