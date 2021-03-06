require 'should'
Archive = require '../Archive'
createData = require './mocks/createData'
describe 'Archive', ->
  describe '#create', ->
    it 'should create a record when given some data', ->
      boogie = createData()
      archive = new Archive("Dog")
      result = archive.create(boogie)
      result.name.should.eql boogie.name
      result.age.should.eql boogie.age
      result.emotion.should.eql boogie.emotion
      newSize = archive.getSize()
      newSize.should.eql 1

  describe '#read', ->
    it 'should return a record from a given id when the record exists', ->
      boogie = createData()
      archive = new Archive("Dog")
      dog = archive.create(boogie)
      result = archive.read(1)
      result.name.should.eql dog.name
      result.age.should.eql dog.age
      result.emotion.should.eql dog.emotion
    
    it 'should return empty from a given id when the record does not exist', ->
      archive = new Archive("Dog")
      result = archive.read("potato")
      result.should.exist

  describe '#find', ->
    it 'should return a record from a given id when the record exists', ->
      boogie = createData()
      archive = new Archive("Dog")
      dog = archive.create(boogie)
      result = archive.find(1)
      result.name.should.eql dog.name
      result.age.should.eql dog.age
      result.emotion.should.eql dog.emotion
    
    it 'should return empty from a given id when the record does not exist', ->
      archive = new Archive("Dog")
      result = archive.find("potato")
      result.should.exist
  
  describe '#update', ->
    it 'should return an updated record from a given id and data when the record exists', ->
      boogie = createData()
      archive = new Archive("Dog")
      dog = archive.create(boogie)
      result = archive.update(1, {name:"Chompie", age:1})
      result.name.should.eql "Chompie"
      result.age.should.eql 1
      result.emotion.should.eql dog.emotion

    it 'should return empty when the record does not exist', ->
      boogie = createData()
      archive = new Archive("Dog")
      dog = archive.create(boogie)
      result = archive.update(50, {name:"Chompie", age:1})
      result.should.not.exist
  
  describe '#remove', ->
    it 'should return the removed record from a given id and remove when the record exists', ->
      boogie = createData()
      archive = new Archive("Dog")
      dog = archive.create(boogie)
      result = archive.remove(1)
      result.name.should.eql boogie.name
      result.age.should.eql boogie.age
      result.emotion.should.eql boogie.emotion
      newSize = archive.getSize()
      newSize.should.eql 0

  describe '#delete', ->
    it 'should return the deleted record from a given id and delete it when the record exists', ->
      boogie = createData()
      archive = new Archive("Dog")
      dog = archive.create(boogie)
      result = archive.delete(1)
      result.name.should.eql boogie.name
      result.age.should.eql boogie.age
      result.emotion.should.eql boogie.emotion
      newSize = archive.getSize()
      newSize.should.eql 0

