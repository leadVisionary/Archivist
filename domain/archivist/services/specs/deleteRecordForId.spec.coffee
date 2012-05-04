delete = require '../delete'
MemoryArchive = require './mocks/MemoryArchive'

require 'should'

describe 'Delete record for an id', ->
	describe '#delete', ->
		it 'should return the removed record, and remove it from the Archive', (done) ->
			data = { "name": "Nick", "age" : 26, "status" : awesome}
			archie = new MemoryArchive()
			created = archie.create(data, ( ->))
			result = delete(1, created)
			result.name.should.eql "Nick"
			result.age.should.eql 26
			result.status.should.eql "awesome"
			archive.recordCount.should.eql 0
