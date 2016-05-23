module.exports = function(grunt) {
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
        src: ["build/js/common.js", "build/js/pre-loader.js", "build/js/animate.js", "build/js/video.js"],
        dest: "public/main.js"
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
          host: "localhost",
          port: 4000
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

  grunt.loadNpmTasks("grunt-contrib-clean");
  grunt.loadNpmTasks("grunt-contrib-jshint");
  grunt.loadNpmTasks("grunt-contrib-uglify");
  grunt.loadNpmTasks("grunt-contrib-sass");
  grunt.loadNpmTasks("grunt-contrib-imagemin");
  grunt.loadNpmTasks("grunt-contrib-copy");
  grunt.loadNpmTasks('grunt-size-report');
  grunt.loadNpmTasks("grunt-contrib-watch");


  grunt.registerTask("default", ["jshint", "clean", "uglify", "sass", "imagemin", "copy", "size_report", "watch"]);

};
