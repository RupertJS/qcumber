module.exports = ->
	require('../../lib/qcumber')(@)

	@Given /a synchronous (?:pre|post)?condition/, ->
		true

	@When /an asynchronous action/, ->
		d = require('q').defer()
		d.resolve()
		d.promise

	@Then /an asynchronous error (?:pre|post)?condition/, ->
		d = require('q').defer()
		d.reject('Error Condition')
		d.promise
		true # Uncomment for a failing test
