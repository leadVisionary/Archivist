Record = require '../Record'
require 'should'

describe 'Record', ->
	describe '#new', ->
		it 'should create a new record with bound properties of the data passed in', (done) ->
			data = { name: "Nick", "age" : 26}
			result = new Record(0, data)
			result.id.should.eql 0
			result.name.should.eql "Nick"
			result.age.should.eql 26
			done()
