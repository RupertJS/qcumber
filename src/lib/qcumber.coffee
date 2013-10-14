Q = require 'q'
module.exports = (steps)->
	_defineStep = steps.defineStep
	qStep = (regex, cb)->
		_defineStep.call steps, regex, (args..., done)->
			Q.when(cb.apply(steps, args))
			.then(->done())
			.catch(done)

	steps.Given = steps.When = steps.Then = steps.defineStep = qStep
