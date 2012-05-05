create = require '../create'
MemoryArchive = require './mocks/MemoryArchive'
createData = require './mocks/createData'

require 'should'

describe 'Create record for some data', ->
	describe '#create', ->
		it 'should return a new record', (done) ->
			data = createData
			archie = new MemoryArchive()
			result = create(data, archie, ( ->))
			result.name.should.eql "Nick"
			archie.recordCount.should.eql 1
