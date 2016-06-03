'use strict';
var config = require('./config.json');
var promptResult;
var _ = require('underscore');
_.str = require('underscore.string');

// Mix in non-conflict functions to Underscore namespace if you want
_.mixin(_.str.exports());

var

  SRC = "build/",
  DEST = "public/",
  JS_PARTIAL = SRC.concat("shared/js/"),
  TEMPLATE_DEFAULT = "_templates/default/",

  FOLDER_LIST = [],
  SIZE_LIST = [];

for (var i = 0; i < config.list.length; i++) {
  for (var j = 0; j < config.list[i].dimension.length; j++) {
    FOLDER_LIST.push(config.jobnumber.concat("_", config.list[i].creative, "_", config.list[i].dimension[j], "/"));
    SIZE_LIST.push(config.list[i].dimension[j]);

  }
}

config.widthList = SIZE_LIST.map(function(a) {
  return a.match(/(\d+)/g)[0];
});
config.heightList = SIZE_LIST.map(function(a) {
  return a.match(/(\d+)/g)[1];
});

var combineJSFiles = [],
  sassFiles = [],
  copySetUpFiles = [],
  copyBuildFiles = [],
  sizeReportFiles = [],
  imageMinFiles = [];

for (var i = 0; i < FOLDER_LIST.length; i++) {
  combineJSFiles[i] = {
    //console.log(string.indexOf(substring) > -1);

    src: (function() {
      var jsList = [JS_PARTIAL.concat("pre-loader.js"), SRC.concat(FOLDER_LIST[i], "_animate.js")];
      if (FOLDER_LIST[i].indexOf("_yt") > -1) jsList.push(SRC.concat(FOLDER_LIST[i], "_video_yt.js"));
      return jsList;
    })(),
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
    src: (function() {
      var jsList = ["**", "!*.tpl"];
      if (FOLDER_LIST[i].indexOf("_yt") == -1) jsList.push("!_video_yt.js");
      return jsList;
    })(),

    dest: SRC.concat(FOLDER_LIST[i])
  };

  copyBuildFiles[i] = {
    expand: true,
    cwd: SRC.concat(FOLDER_LIST[i]),
    src: ["*.*", "!*.scss", "!*.psd", "!*.{jpg,png,gif,svg}", "!_animate.js", "!_video_yt.js"],
    dest: DEST.concat(FOLDER_LIST[i])
  };

  sizeReportFiles[i] = {
    list: DEST.concat(FOLDER_LIST[i], "*.*")
  };

}

module.exports = function(grunt) {

  // load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.initConfig({

    prompt: {
      init: {
        options: {
          questions: [{
              config: 'jobnumber',
              type: 'input', // list, checkbox, confirm, input, password 
              message: 'What is the job number?',
              default: 'JOB0000',
              filter: function(value) {
                return value.replace(/\s/g, '');
              }
            },

            {
              config: 'description',
              type: 'input', // list, checkbox, confirm, input, password 
              message: 'Project description?',
              default: 'Simple inpage digital banners.'
            }
          ],
          then: function(results) {
            promptResult = results;
          }
        }
      },
      addCreative: {
        options: {
          questions: [{
              config: 'creative',
              type: 'input', // list, checkbox, confirm, input, password 
              message: 'Name of the creative?',
              default: 'Concept-A',
              filter: function(value) {
                return value.replace(/\s/g, '');
              }
            },

            {
              config: 'dimension',
              type: 'checkbox', // list, checkbox, confirm, input, password 
              message: 'Banner sizes under this creative - Pick as many as you want.',
              default: ["300x250"],
              choices: ["300x250", "728x90", "300x600", "160x600", "120x600", "980x150", "970x250", "980x250", "970x250(+YouTube Video)", "980x250(+YouTube Video)"],
              filter: function(value) {
                value = value.map(function(arr) {
                  arr = arr.replace("(+YouTube Video)", "_yt");
                  return arr;
                });
                grunt.log.oklns(value);
                return value;
              }
            },

            {
              config: 'addMore',
              type: 'confirm', // list, checkbox, confirm, input, password 
              message: 'Add another creative? :',
              default: false
            }
          ],
          then: function(results) {

            if (promptResult.list == undefined) promptResult.list = [];

            var creative = results.creative,
              dimension = results.dimension,
              addMore = results.addMore;

            delete results.creative;
            delete results.dimension;
            delete results.addMore;

            promptResult.list.push({
              creative: creative,
              dimension: dimension
            });


            if (!addMore) {
              console.log(JSON.stringify(promptResult));
              grunt.file.write("config.json", JSON.stringify(promptResult));


            } else {
              grunt.task.run("prompt:addCreative");
            }

          }

        }
      }
    },


    mkdir: {
      setUp: {
        options: {
          create: FOLDER_LIST.map(function(a) {
            return SRC.concat(a);
          })
        }
      }
    },

    clean: {
      code: {
        src: ["public/**.{html,js,css}", "!public/preview.html"]
      },
      image: {
        src: ["public/**.{jpg,png,gif,svg}"]
      },
      reset: {
        src: ["public/", "build/"]

      }

    },

    jshint: {
      all: {
        src: "build/**/*.js"
      }
    },

    uglify: {
      all: {
        files: combineJSFiles
      }
    },

    concat: {
      all: {
        files: combineJSFiles
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
        files: copySetUpFiles.concat({
          expand: true,
          cwd: "_templates/",
          src: "shared/**/*.*",
          dest: SRC
        })
      },
      build: {
        files: copyBuildFiles
      }
    },
    size_report: {
      all: {

        files: sizeReportFiles

      }
    },
    watch: {
      options: {
        livereload: {
          host: "localhost",
          port: 4014
        }
      },
      codeUpdated: {
        files: ["build/**/*.{html,js,css,scss}"],
        tasks: ["jshint", "clean:code", "concat", "sass", "copy:build", "size_report"]
      },
      imageUpdated: {
        files: ["build/**/*.{jpg,png,gif,svg}"],
        tasks: ["clean:image", "imagemin", "size_report"]
      }
    },
    connect: {
      server: {
        options: {
          port: 9054,
          base: 'public/'
        }
      }
    },
    open: {
      server: {
        path: 'http://localhost:9054/preview.html',
      }
    }

  });

  grunt.registerTask("default", ["jshint", "clean:code", "clean:image", "concat", "sass", "imagemin", "copy:build", "size_report", 'connect:server', 'open', "watch"]);

  grunt.registerTask("buildBootstrapper", "builds the bootstrapper file correctly", function() {
    for (var i = 0; i < FOLDER_LIST.length; i++) {
      var bootStrapSASS = grunt.file.read(TEMPLATE_DEFAULT.concat("_main.scss.tpl"));
      bootStrapSASS = grunt.template.process(bootStrapSASS, { data: { width: config.widthList[i], height: config.heightList[i] } });
      grunt.file.write(SRC.concat(FOLDER_LIST[i], "main.scss"), bootStrapSASS);

      var bootStrapIndexHTML = grunt.file.read(TEMPLATE_DEFAULT.concat("_index.html.tpl"));
      bootStrapIndexHTML = grunt.template.process(bootStrapIndexHTML, { data: { title: FOLDER_LIST[i].replace("/", "") } });
      grunt.file.write(SRC.concat(FOLDER_LIST[i], "index.html"), bootStrapIndexHTML);

    }
    var bootStrapPreviewHTML = grunt.file.read("_templates/_preview.html.tpl");
    bootStrapPreviewHTML = grunt.template.process(bootStrapPreviewHTML, { data: { jobnumber: config.jobnumber, description: config.description, foldername: FOLDER_LIST, width: config.widthList, height: config.heightList } });
    grunt.file.write("public/preview.html", bootStrapPreviewHTML);
  });

  grunt.registerTask("okMessage", "Output OK message at the end of project set up", function() {
            grunt.log.oklns("");
            grunt.log.oklns("=================================");
            grunt.log.oklns("Your build system is now complete.");
            grunt.log.oklns("Run 'grunt' to fire up the workflow.");
            grunt.log.oklns("=================================");
            grunt.log.oklns("");
            grunt.log.oklns("...__   ___    _  _____");
            grunt.log.oklns("../  \ / o | .' \/_  _/");
            grunt.log.oklns("./ o |/  ,' / o / / /  ");
            grunt.log.oklns("/__,'/_/`_\/_n_/ /_/   ");
            grunt.log.oklns("=================================");
            grunt.log.oklns("");
            grunt.log.oklns(" IMPORTANT! Don't forget to turn off the ad blocker!!");
            grunt.log.oklns("");



  });

  grunt.registerTask("setUp", ["buildBootstrapper", "copy:setUp","okMessage"]);
  grunt.registerTask("reset", ["prompt", "clean:reset", "setUp"]);
  grunt.registerTask("restart", ["clean:reset", "setUp", "default"]);


};
