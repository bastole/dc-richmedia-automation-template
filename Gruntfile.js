'use strict';
var config = require('./config.json');
var promptResult;
var _ = require('underscore');
_.str = require('underscore.string');

// Mix in non-conflict functions to Underscore namespace if you want
_.mixin(_.str.exports());

var
  LIVERELOAD_HOST = "localhost",
  LIVERELOAD_PORT = 4000,
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
  imageMinFiles = [];

for (var i = 0; i < FOLDER_LIST.length; i++) {
  combineJSFiles[i] = {
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

module.exports = function(grunt) {

  // load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);


  grunt.initConfig({

    prompt: {
      init: {
        options: {
          questions: [
          {
            config: 'jobnumber', // arbitrary name or config for any other grunt task 
            type: 'input', // list, checkbox, confirm, input, password 
            message: 'What is the job number? (e.g. JOB0000)', // Question to ask the user, function needs to return a string, 
            default: 'JOB0000', // default value if nothing is entered 
            filter: function(value) {
                return value.replace(/\s/g, '');
            } // modify the answer 
          },

          {
            config: 'description', // arbitrary name or config for any other grunt task 
            type: 'input', // list, checkbox, confirm, input, password 
            message: 'Description :', // Question to ask the user, function needs to return a string, 
            default: 'Digital banners.' // default value if nothing is entered 
          }],
          then: function(results) {
            promptResult = results;
          }
        }
      },
      addCreative: {
        options: {
          questions: [
          {
            config: 'creative', // arbitrary name or config for any other grunt task 
            type: 'input', // list, checkbox, confirm, input, password 
            message: 'Creative name (e.g. Concept-A))', // Question to ask the user, function needs to return a string, 
            default: 'Concept-A', // default value if nothing is entered 
            filter: function(value) {
                return value.replace(/\s/g, '');
            } // modify the answer 
          },

          {
            config: 'dimension', // arbitrary name or config for any other grunt task 
            type: 'checkbox', // list, checkbox, confirm, input, password 
            message: 'Pick all sizes :', // Question to ask the user, function needs to return a string, 
            default: ["300x250"], // default value if nothing is entered 
            choices: ["300x250", "728x90", "300x600", "160x600", "120x600", "970x250", "980x250", "980x150"]
          },

          {
            config: 'addMore', // arbitrary name or config for any other grunt task 
            type: 'confirm', // list, checkbox, confirm, input, password 
            message: 'Add more creatives? :', // Question to ask the user, function needs to return a string, 
            default: false // default value if nothing is entered 
          }],
          then: function(results) {

            if(promptResult.list == undefined) promptResult.list = [];

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


            }
            else  {
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
        files: copySetUpFiles
      },
      build: {
        files: copyBuildFiles
      }
    },
    size_report: {
      your_target: {
        files: {
          list: [DEST + "*", SRC + "*"]
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
        tasks: ["jshint", "clean", "concat", "sass", "copy:build", "size_report"]
      },
      imageUpdated: {
        files: ["build/**/*.{jpg,png,gif,svg}"],
        tasks: ["imagemin", "size_report"]
      }
    }

  });

  grunt.registerTask("default", ["jshint", "clean", "concat", "sass", "imagemin", "copy:build", "size_report", "watch"]);

  grunt.registerTask("buildBootstrapper", "builds the bootstrapper file correctly", function() {
    //    console.log(JSON.stringify(config));

    for (var i = 0; i < FOLDER_LIST.length; i++) {
      var bootStrapSASS = grunt.file.read(TEMPLATE_DEFAULT.concat("_main.scss.tpl"));
      bootStrapSASS = grunt.template.process(bootStrapSASS, { data: { width: config.widthList[i], height: config.heightList[i] } });
      grunt.file.write(SRC.concat(FOLDER_LIST[i], "main.scss"), bootStrapSASS);

      var bootStrapHTML = grunt.file.read(TEMPLATE_DEFAULT.concat("_index.html.tpl"));
      bootStrapHTML = grunt.template.process(bootStrapHTML, { data: { title: FOLDER_LIST[i].replace("/","") } });
      grunt.file.write(SRC.concat(FOLDER_LIST[i], "index.html"), bootStrapHTML);

    }

  });

  grunt.registerTask("setUp", ["buildBootstrapper", "copy:setUp"]);



};
