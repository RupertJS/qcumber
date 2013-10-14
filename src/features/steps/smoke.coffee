module.exports = ->
	require('../../lib/qcumber')(@)

	@Given /a synchronous (?:pre|post)condition/, ->
		true

