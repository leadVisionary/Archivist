require 'should'
Archive = require '../Archive'

describe 'Archive', ->
  describe '#create', ->
    it 'should create a record when given some data', ->
      boogie = { "name" : "Boogie",
                 "age"  : 2,
                 "emotion" : "happy" }
      archive = new Archive("Dog")
      result = archive.create(boogie)
      result.should.be.true
      newSize = archive.getSize()
      newSize.should.eql 1


