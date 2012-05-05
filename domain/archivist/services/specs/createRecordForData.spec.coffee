create = require '../create'
MemoryArchive = require './mocks/MemoryArchive'
createData = require './mocks/createData'

require 'should'

describe 'Create record for some data', ->
	describe '#create', ->
		it 'should return a new record', ->
      data = createData()
      archie = new MemoryArchive()
      result = create(data, archie, ( ->))
      result.name.should.eql "Nick"
      size = archie.getSize()
      size.should.eql 1
