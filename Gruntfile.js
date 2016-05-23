module.exports = function(grunt) {

var 
LIVERELOAD_HOST = "localhost",
LIVERELOAD_PORT = 4000,
UGLIFY_SRC = ["build/js/base.js", "build/js/pre-loader.js", "build/js/animate.js", "build/js/video.js"],
UGLIFY_DEST = "public/main.js",
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
        src: "public/*.{html,js,css}"
      } 
    },

    jshint: {
      dist: {
        src: "build/js/*.js"
      }
    },

    uglify: {
      dist: {
        src: UGLIFY_SRC,
        dest: UGLIFY_DEST
      }
    },

    sass: {
      options: {
        sourcemap: "none"
      },
      dist: {
        src: "build/sass/main.scss",
        dest: "public/style.css"
      }
    },

    imagemin: {
      dist: {
        expand: true,
        cwd: "build/images/",
        src: "*.{jpg,png,gif,svg}",
        dest: "public/"

      }
    },

    copy: {
      html: {
        expand: true,
        cwd: "build/",
        src: ["*.html"],
        dest: "public/"
      },
      js: {
        expand: true,
        cwd: "build/js",
        src: ["init.js"],
        dest: "public/"
      },
      video: {
        expand: true,
        cwd: "build/video",
        src: "*.{mp4, ogg, ogv, webm}",
        dest: "public/"
      },
      backup: {
        expand: true,
        cwd: "build/backup",
        src: "*.{jpg,gif,png}",
        dest: "public/"
      }
    },
    size_report: {
        your_target: {
            files: {
                list: ["public/*.*"]
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
