require 'should'
describe 'loading from lib', ->
	it 'returns a function', ->
		qcumber = require '../../lib/qcumber'
		qcumber.should.be.a.Function
