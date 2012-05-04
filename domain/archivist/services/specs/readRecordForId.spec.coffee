read = require '../read'
MemoryArchive = require './mocks/MemoryArchive'

require 'should'

describe 'Read record for an id', ->
	describe '#read', ->
		it 'should return a record', (done) ->
			data = { "name": "Nick", "age" : 26, "status" : awesome}
			archie = new MemoryArchive()
			created = archie.create(data, ( ->))
			result = read(1, created)
			result.name.should.eql "Nick"
			result.age.should.eql 26
			result.status.should.eql "awesome"
