module.exports = (grunt)->

	grunt.initConfig
		cucumberjs:
			qcumber:
				files: src: ['src/features/*.feature']
				options:
					steps: 'src/features/steps'

	grunt.npmTasks = [
		"grunt-cucumber"
	]

	grunt.loadNpmTasks npm for npm in grunt.npmTasks

	grunt.registerTask 'test', ['cucumberjs']
	grunt.registerTask 'default', ['test']
