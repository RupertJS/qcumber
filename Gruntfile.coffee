module.exports = (grunt)->

	grunt.initConfig
		cucumberjs:
			qcumber:
				files: src: ['src/features/*.feature']
				options:
					steps: 'src/features/steps'
		mochaTest:
			lib:
				options:
					reporter: 'nyan'
					require: 'coffee-script'
				src: ['src/test/*.coffee']


	grunt.npmTasks = [
		"grunt-cucumber"
		"grunt-mocha-test"
	]

	grunt.loadNpmTasks npm for npm in grunt.npmTasks

	grunt.registerTask 'test', [
		'mochaTest',
		'cucumberjs'
	]

	grunt.registerTask 'default', ['test']
