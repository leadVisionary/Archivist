read = require '../read'
MemoryArchive = require './mocks/MemoryArchive'
createData = require './mocks/createData'

require 'should'

describe 'Read record for an id', ->
	describe '#read', ->
		it 'should return a record', (done) ->
			data = createData
			archie = new MemoryArchive()
			created = archie.create(data, ( ->))
			result = read(1, created)
			result.name.should.eql "Nick"
			result.age.should.eql 26
			result.status.should.eql "awesome"
