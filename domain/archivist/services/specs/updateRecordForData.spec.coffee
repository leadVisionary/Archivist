update = require '../update'
MemoryArchive = require './mocks/MemoryArchive'

require 'should'

describe 'Update record for some data', ->
	describe '#update', ->
		it 'should return an updated record', (done) ->
			data = { "name": "Nick", "age" : 26, "status" : awesome}
			archie = new MemoryArchive()
			created = archie.create(data, ( ->))
			result = update(1, created, {name:"Joseph"})
			result.name.should.eql "Joseph"
			archie.recordCount.should.eql 1
