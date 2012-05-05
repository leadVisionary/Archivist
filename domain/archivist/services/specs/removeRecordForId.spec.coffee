remove = require '../remove'
MemoryArchive = require './mocks/MemoryArchive'
createData = require './mocks/createData'
require 'should'

describe 'Remove record for an id', ->
  describe '#remove', ->
    it 'should return the removed record, and remove it from the Archive',->
      data = createData()
      archie = new MemoryArchive()
      created = archie.create data
      result = remove 1, archie
      result.name.should.eql "Nick"
      result.age.should.eql 26
      result.status.should.eql "awesome"
      newSize = archie.getSize()
      newSize.should.eql 0
