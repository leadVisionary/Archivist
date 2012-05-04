create = require '../create'
MemoryArchive = require './mocks/MemoryArchive'

require 'should'

describe 'Create record for some data', ->
	describe '#create', ->
		it 'should return a new record', (done) ->
			data = { "name": "Nick", "age" : 26, "status" : awesome}
			archie = new MemoryArchive()
			result = create(data, archie, ( ->))
			result.name.should.eql "Nick"
			archie.recordCount.should.eql 1
