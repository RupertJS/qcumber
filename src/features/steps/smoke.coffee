module.exports = ->
	require('../../lib/qcumber')(@)

	@Given /a synchronous (?:pre|post)condition/, ->
		true

	@When /an asynchronous action/, ->
		d = require('q').defer()
		d.resolve()
		d.promise
