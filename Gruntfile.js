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
    JS_PARTIAL = SRC.concat("shared/"),
    TEMPLATE_DEFAULT = "_templates/default/",
    FOLDER_LIST = [],
    SIZE_LIST = [];

var
    combineJSFiles = [],
    sassFiles = [],
    copySetUpFiles = [],
    copyBuildFiles = [],
    sizeReportFiles = [],
    imageMinFiles = [],
    screenshotFiles = [],
    widthList = [],
    heightList = [];

for (var i = 0; i < config.list.length; i++) {
    for (var j = 0; j < config.list[i].dimension.length; j++) {
        FOLDER_LIST.push(config.jobnumber.concat("_", config.list[i].creative, "_", config.list[i].dimension[j], "/"));
        SIZE_LIST.push(config.list[i].dimension[j]);

    }
}

widthList = SIZE_LIST.map(function(a) {
    return a.match(/(\d+)/g)[0];
});
heightList = SIZE_LIST.map(function(a) {
    return a.match(/(\d+)/g)[1];
});

for (var i = 0; i < FOLDER_LIST.length; i++) {
    combineJSFiles[i] = {

        src: (function() {
            var jsList = [JS_PARTIAL.concat("pre-loader.js"), SRC.concat(FOLDER_LIST[i], "_animate.js")];
            if (FOLDER_LIST[i].indexOf("_yt") > -1) jsList.push(SRC.concat(FOLDER_LIST[i], "_video_yt.js"));
            return jsList;
        })(),
        dest: DEST.concat(FOLDER_LIST[i], "main.js")
    };
    sassFiles[i] = {
        src: SRC.concat(FOLDER_LIST[i], "local.scss"),
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
    screenshotFiles[i] = {
        expand: true,
        cwd: DEST.concat(FOLDER_LIST[i]),
        src: ["index.html"],
        dest: "backup/".concat(FOLDER_LIST[i]),
        ext: ".png"
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
                            choices: ["300x250", "728x90", "300x600", "160x600", "120x600", "468x60", "300x100", "640x200", "980x150", "970x250", "980x250" /*, "970x250(+YouTube Video)", "980x250(+YouTube Video)"*/ ],
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
            create: {
                options: {
                    create: FOLDER_LIST.map(function(a) {
                        return SRC.concat(a);
                    })
                }
            }
        },

        clean: {
            code: {
                src: ["public/**.{html,js,css}", "!public/index.html", "!public/html2canvas.js", "!public/gsap-timeline-slider.js"]
            },
            image: {
                src: ["public/**.{jpg,png,gif,svg}"]
            },
            delete: {
                src: ["public/", "build/"]

            }

        },

        jshint: {
            all: {
                src: "build/**/*.js"
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
            imagemin: {
                files: imageMinFiles
            }
        },

        copy: {
            create: {
                files: copySetUpFiles.concat({
                        expand: true,
                        cwd: "_templates/",
                        src: ["html2canvas.js", "gsap-timeline-slider.js"],
                        dest: DEST
                    }, {
                        expand: true,
                        cwd: "_templates/",
                        src: "shared/**/*.*",
                        dest: SRC
                    }

                )
            },
            build: {
                files: copyBuildFiles
            },

            imagemin: {
                files: imageMinFiles.concat({
                    expand: true,
                    flatten: true,
                    cwd: SRC,
                    src: ["**/*.{jpg,png,gif,svg}"],
                    dest: DEST
                })
            }

        },
        size_report: {
            all: {

                files: sizeReportFiles

            }
        },

        wait: {
            options: {
                delay: 500
            },
            pause: {
                options: {
                    before: function(options) {
                        console.log('pausing %dms', options.delay);
                    },
                    after: function() {
                        console.log('pause end');
                    }
                }
            }
        },

        zip_directories: {
            zip: {
                files: [{
                    filter: "isDirectory",
                    expand: true,
                    cwd: DEST,
                    src: ["*"],
                    dest: "zipped/"
                }]
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
                tasks: ["jshint", "clean:code", "concat", "sass", "copy:build"]
            },
            imageUpdated: {
                files: ["build/**/*.{jpg,png,gif,svg}"],
                tasks: ["clean:image", "imagemin:imagemin"]
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
            workfolder: {
                path: SRC,
            },
            zip: {
                path: 'zipped/',
            },
            server: {
                path: 'http://localhost:9054/',
            }
        }

    });

    grunt.registerTask("default", ["jshint", "clean:code", "clean:image", "concat", "sass", "imagemin:imagemin", "copy:build", "connect:server", "open:server", "watch"]);

    grunt.registerTask("buildBootstrapper", "builds the bootstrapper file", function() {
            for (var i = 0; i < FOLDER_LIST.length; i++) {
                var bootStrapSASS = grunt.file.read(TEMPLATE_DEFAULT.concat("_local.scss.tpl"));
                bootStrapSASS = grunt.template.process(bootStrapSASS, {
                    data: {
                        width: widthList[i],
                        height: heightList[i]
                    }
                });
                grunt.file.write(SRC.concat(FOLDER_LIST[i], "local.scss"), bootStrapSASS);

                var bootStrapIndexHTML = grunt.file.read(TEMPLATE_DEFAULT.concat("_index.html.tpl"));
                bootStrapIndexHTML = grunt.template.process(bootStrapIndexHTML, {
                    data: {
                        title: FOLDER_LIST[i].replace("/", "")
                    }
                });
                grunt.file.write(SRC.concat(FOLDER_LIST[i], "index.html"), bootStrapIndexHTML);

            }
            var bootStrapPreviewHTML = grunt.file.read("_templates/_preview.html.tpl");
            bootStrapPreviewHTML = grunt.template.process(bootStrapPreviewHTML, {
                data: {
                    config: JSON.stringify(config),
                    jobnumber: config.jobnumber,
                    description: config.description,
                    foldername: FOLDER_LIST,
                    width: widthList,
                    height: heightList
                }
            });
            grunt.file.write("public/index.html", bootStrapPreviewHTML);
        }

    );
    //
    grunt.registerTask("okMessage", "Output OK message at the end of project set up", function() {

        console.log("");
        console.log("");
        console.log("");
        console.log("");
        console.log("");
        console.log("█████████████████████████████████████");
        console.log("▌───────────────────────────────────▐");
        console.log("▌───────────────────────────▐█──────▐");
        console.log("▌──────▄──────────────────▄█▓█▌─────▐");
        console.log("▌─────▐██▄───────────────▄▓░░▓▓─────▐");
        console.log("▌─────▐█░██▓────────────▓▓░░░▓▌─────▐");
        console.log("▌─────▐█▌░▓██──────────█▓░░░░▓──────▐");
        console.log("▌──────▓█▌░░▓█▄███████▄███▓░▓█──────▐");
        console.log("▌──────▓██▌░▓██░░░░░░░░░░▓█░▓▌──────▐");
        console.log("▌───────▓█████░░░░░░░░░░░░▓██───────▐");
        console.log("▌───────▓██▓░░░░░░░░░░░░░░░▓█───────▐");
        console.log("▌───────▐█▓░░░░░░█▓░░▓█░░░░▓█▌──────▐");
        console.log("▌───────▓█▌░▓█▓▓██▓░█▓▓▓▓▓░▓█▌──────▐");
        console.log("▌───────▓▓░▓██████▓░▓███▓▓▌░█▓──────▐");
        console.log("▌──────▐▓▓░█▄▐▓▌█▓░░▓█▐▓▌▄▓░██──────▐");
        console.log("▌──────▓█▓░▓█▄▄▄█▓░░▓█▄▄▄█▓░██▌─────▐");
        console.log("▌──────▓█▌░▓█████▓░░░▓███▓▀░▓█▓─────▐");
        console.log("▌─────▐▓█░░░▀▓██▀░░░░░─▀▓▀░░▓█▓─────▐");
        console.log("▌─────▓██░░░░░░░░▀▄▄▄▄▀░░░░░░▓▓─────▐");
        console.log("▌─────▓█▌░░░░░░░░░░▐▌░░░░░░░░▓▓▌────▐");
        console.log("▌─────▓█░░░░░░░░░▄▀▀▀▀▄░░░░░░░█▓────▐");
        console.log("▌────▐█▌░░░░░░░░▀░░░░░░▀░░░░░░█▓▌───▐");
        console.log("▌────▓█░░░░░░░░░░░░░░░░░░░░░░░██▓───▐");
        console.log("▌────▓█░░░░░░░░░░░░░░░░░░░░░░░▓█▓───▐");
        console.log("▌────██░░░░░░░░░░░░░░░░░░░░░░░░█▓───▐");
        console.log("▌────█▌░░░░░░░░░░░░░░░░░░░░░░░░▐▓▌──▐");
        console.log("█████████████████████████████████████");
        console.log(" ______   ______    _______  _______ ");
        console.log("|      | |    _ |  |   _   ||       |");
        console.log("|  _    ||   | ||  |  |_|  ||_     _|");
        console.log("| | |   ||   |_||_ |       |  |   |  ");
        console.log("| |_|   ||    __  ||       |  |   |  ");
        console.log("|       ||   |  | ||   _   |  |   |  ");
        console.log("|______| |___|  |_||__| |__|  |___|  ");
        console.log("");
        console.log("███████████████████████ ██████████████");

        grunt.log.oklns("Set up is now complete.");
        grunt.log.oklns("");
        grunt.log.oklns("Run 'grunt' to start building.");


    });
    grunt.registerTask("create", "Creates build/ and public/", ["buildBootstrapper", "copy:create", "okMessage", "open:workfolder"]);
    grunt.registerTask("delete", "Deletes build/ and public/", ["clean:delete"]);
    grunt.registerTask("start", "Starts a new project", ["delete", "prompt"]);
    grunt.registerTask("restart", ["delete", "create", "default"]);
    grunt.registerTask("zip", "Zips banners to /zipped for easy upload", ["zip_directories", "open:zip"]);
    grunt.registerTask("test", ["buildBootstrapper", "copy:create", "okMessage", "jshint", "clean:code", "clean:image", "concat", "sass", "imagemin:imagemin", "copy:build", "connect:server"]);

};
