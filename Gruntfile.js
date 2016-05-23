module.exports = function(grunt) {

var 
LIVERELOAD_HOST = "localhost",
LIVERELOAD_PORT = 4000,
BANNER_LIST = ["300x250/", "300x600/", "728x90/", "160x600/"],
SRC = "build/",
DEST = "public/",
JS_SRC = "template/js-partial/",

GRUNT_TASKS = [
  "grunt-contrib-clean",
  "grunt-contrib-jshint",
  "grunt-contrib-uglify",
  "grunt-contrib-sass",
  "grunt-contrib-imagemin",
  "grunt-contrib-copy",
  "grunt-size-report",
  "grunt-contrib-watch"];

  grunt.initConfig({
    clean: {
      dist: {
        src: DEST+"**.{html,js,css}"
      } 
    },

    jshint: {
      dist: {
        src: "build/**.js"
      }
    },

    uglify: {
      dist: {
        src: [JS_SRC+"base.js", JS_SRC+"pre-loader.js", SRC+BANNER_LIST[0]+"animate.js"],
        dest: DEST+BANNER_LIST[0]+"main.js"
      }
    },

    sass: {
      options: {
        sourcemap: "none"
      },
      dist: {
        src: SRC+BANNER_LIST[0]+"main.scss",
        dest: DEST+BANNER_LIST[0]+"style.css"
      }
      
    },

    imagemin: {
      dist: {
        expand: true,
        cwd: SRC+BANNER_LIST[0]+"images/",
        src: "*.{jpg,png,gif,svg}",
        dest: DEST+BANNER_LIST[0]

      }
    },

    copy: {
      html: {
        expand: true,
        cwd: SRC+BANNER_LIST[0],
        src: ["*.html"],
        dest: DEST+BANNER_LIST[0]
      },
      js: {
        expand: true,
        cwd: SRC+BANNER_LIST[0]+"js",
        src: ["init.js"],
        dest: DEST+BANNER_LIST[0]
      },
      video: {
        expand: true,
        cwd: SRC+BANNER_LIST[0]+"video",
        src: "*.{mp4, ogg, ogv, webm}",
        dest: DEST+BANNER_LIST[0]
      },
      backup: {
        expand: true,
        cwd: SRC+BANNER_LIST[0]+"backup",
        src: "*.{jpg,gif,png}",
        dest: DEST+BANNER_LIST[0]
      }
    },
    size_report: {
        your_target: {
            files: {
                list: [DEST+"*"]
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

for(var i = 0; i < GRUNT_TASKS.length; i++){
  grunt.loadNpmTasks(GRUNT_TASKS[i]);  
} 
  grunt.registerTask("default", ["jshint", "clean", "uglify", "sass", "imagemin", "copy", "size_report", "watch"]);

};
