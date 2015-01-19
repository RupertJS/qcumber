Q = require 'q'
module.exports = (steps)->
	return if steps._qed
	steps._qed = true
	_defineStep = steps.defineStep
	qStep = (regex, cb)->
		_defineStep.call steps, regex, (args..., done)->
			Q.when(cb.apply(@, args))
			.then(->done())
			.catch(done)

	steps.Given = steps.When = steps.Then = steps.defineStep = qStep
