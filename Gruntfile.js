module.exports = function (grunt) {
	pkg: grunt.file.readJSON('package.json'),
	grunt.initConfig({
		sass: {
			dist: {
				options: {
					style: 'compressed',
						sourcemap: false,
						noCache: true
				},
				files: {
					'public_html/css/main.css' : 'public_html/scss/main.scss'
				}
			}
		},
		cssmin: {
			target: {
				files: {
					'public_html/dest/css/main.min.css': 'public_html/css/main.css'
				}
			}
		},
		coffee: {
			compile: {
				files: {
					'public_html/dest/js/main.js': ['public_html/js/src/localize.coffee','public_html/js/src/*.coffee'] 
				}
			}
		},
		uglify: {
			dist: {
				files: {
					'public_html/dest/js/main.min.js': 'public_html/dest/js/main.js'
				}
			}
		},
		htmlmin: {
			dist: {
				files: {
					'public_html/dest/index.html': 'public_html/index.html',
					'public_html/dest/test.html': 'public_html/test.html'
				},
				options: {
					removeComments: true,
					collapseWhitespace: true
				}
			}
		},
		connect: {
      server: {
        options: {
          port: 9001,
          hostname: '*',
					base: "public_html/dest"
        }
      }
    },
		yuidoc: {
			dist: {
				name: 'trash app',
				description: '',
				version: '1.0.0',
				options: {
					paths: './public_html/js/src/',
					outdir: 'yuidocs/'
				}
			}
		},
		copy: {
			images: {
				files: [
          {expand: true, cwd: "public_html/images", src: "**", dest: "public_html/dest/images"}
        ]
			},
			libs: {
				files: [
					{expand: true, cwd: "public_html/js/libs", src: "**", dest: "public_html/dest/js/libs"}
				]
			},
			data: {
				files: [
					{expand: true, cwd: "public_html/data", src: "**", dest: "public_html/dest/data"}
				]
			}
		},
		sshexec: {
			testup: {
				command: 'bash ./testup.sh',
				options: {
					host: '54.64.95.43',
					username: 'tsukamoto',
					password: '',
					privateKey: grunt.file.read("/Users/tsukamoto/.ssh/id_rsa")
				}
			}
		},
		sftp: {
			html: {
				files: {
					"./": "public_html/dest/*"
				},
				options: {
					path: "/home/tsukamoto/dest/",
					host: "54.64.95.43",
					username: 'tsukamoto',
					password: "",
					privateKey: grunt.file.read("/Users/tsukamoto/.ssh/id_rsa"),
					srcBasePath: "public_html/dest/"

				}
			},
			css: {
				files: {
					"./": "public_html/dest/css/*"
				},
				options: {
					path: "/home/tsukamoto/dest/css/",
					host: "54.64.95.43",
					username: 'tsukamoto',
					password: "",
					privateKey: grunt.file.read("/Users/tsukamoto/.ssh/id_rsa"),
					srcBasePath: "public_html/dest/css"
				}
			},
			js: {
				files: {
					"./": "public_html/dest/js/*"
				},
				options: {
					path: "/home/tsukamoto/dest/js/",
					host: "54.64.95.43",
					username: 'tsukamoto',
					password: "",
					privateKey: grunt.file.read("/Users/tsukamoto/.ssh/id_rsa"),
					srcBasePath: "public_html/dest/js"
				}
			},
			jslibs: {
				files: {
					"./": "public_html/dest/js/libs/*"
				},
				options: {
					path: "/home/tsukamoto/dest/js/libs/",
					host: "54.64.95.43",
					username: 'tsukamoto',
					password: "",
					privateKey: grunt.file.read("/Users/tsukamoto/.ssh/id_rsa"),
					srcBasePath: "public_html/dest/js/libs"
				}
			},
			images: {
				files: {
					"./": "public_html/dest/images/*"
				},
				options: {
					path: "/home/tsukamoto/dest/images/",
					host: "54.64.95.43",
					username: 'tsukamoto',
					password: "",
					privateKey: grunt.file.read("/Users/tsukamoto/.ssh/id_rsa"),
					srcBasePath: "public_html/dest/images"
				}
			}
		},
		watch: {
			sass: {
				files: ["public_html/scss/*.scss"],
				tasks: ['sass', 'cssmin', 'sftp:css', 'sshexec']
			},
			js: {
				files: 'public_html/js/src/*.coffee',
				tasks: ['coffee', 'uglify', 'sftp:js', 'sshexec']
			},
			html: {
				files: 'public_html/*.html',
				tasks: ['htmlmin', 'sftp:html', 'sshexec']
			},
			image: {
				files: 'public_html/images/**',
				tasks: ['copy', 'sftp:images', 'sshexec']
			},
			options: {
				livereload: true
			}
		}
});
grunt.loadNpmTasks('grunt-contrib-concat');
grunt.loadNpmTasks('grunt-contrib-coffee');
grunt.loadNpmTasks('grunt-contrib-uglify');
grunt.loadNpmTasks('grunt-contrib-sass');
grunt.loadNpmTasks('grunt-contrib-cssmin');
grunt.loadNpmTasks('grunt-contrib-yuidoc');
grunt.loadNpmTasks('grunt-contrib-htmlmin');
grunt.loadNpmTasks('grunt-contrib-connect');
grunt.loadNpmTasks('grunt-contrib-copy');
grunt.loadNpmTasks('grunt-contrib-watch');
grunt.loadNpmTasks('grunt-ssh');
grunt.registerTask('default', ['coffee', 'uglify', 'sass', 'cssmin', 'htmlmin', 'copy', 'connect', 'sftp', 'sshexec', 'watch']);
};
