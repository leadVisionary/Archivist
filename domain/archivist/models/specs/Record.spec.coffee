Record = require '../Record'
require 'should'
describe 'Record', ->
	describe '#new', ->
		it 'should create a new record with bound properties of the data passed in', ->
      data =
        name: "Nick"
        age: 26

      result = new Record(0, data)
      result.id.should.eql 0
      result.name.should.eql "Nick"
      result.age.should.eql 26

  describe '#setProperty', ->
    it 'should set the properties of a record to match passed in data(used later for updates)', ->
      data2 = {name: "Nick", age: 26}
      result = new Record 0, data2
      result.setProperty "name", "Joseph"
      result.name.should.eql "Joseph"

  describe '#addProperties', ->
    it 'should add the keys and values of its input to the record', ->
      result = new Record 0
      data2 = {name: "Nick", age: 26}
      result.addProperties data2
      result.name.should.eql "Nick"
      result.age.should.eql 26

  describe '#setValidationStrategies', ->
    it "should set the record's validation strategies object to the input", ->
      strategies = {age: (arg)-> arg > 0}
      result = new Record 0
      result.setValidationStrategies strategies
      badData = {name: 'fetus', age: -1}
      badFunction = -> result.addProperties badData
      badFunction.should.throw 'Validation failed for age: -1'
      
