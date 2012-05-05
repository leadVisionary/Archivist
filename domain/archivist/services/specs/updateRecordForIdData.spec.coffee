update = require '../update'
MemoryArchive = require './mocks/MemoryArchive'
createData = require './mocks/createData'

require 'should'

describe 'Update record for some data', ->
	describe '#update', ->
		it 'should return an updated record', (done) ->
			data = createData
			archie = new MemoryArchive()
			created = archie.create(data, ( ->))
			result = update(1, created, {name:"Joseph"})
			result.name.should.eql "Joseph"
			archie.recordCount.should.eql 1
