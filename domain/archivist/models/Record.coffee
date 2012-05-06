class Record
	constructor: (@id, data) ->
    @setProperty key, value  for own key, value of data

	setProperty: (property, value) ->
		@["#{property}"] = value

module.exports = Record

createRecord = (id, data)->
  data.should.not.have.property 'id'
  newData = {id: id, data: data.clone}
  newData.id = id
  return newData







objectIsRecord = (object)->
  object?.id? and object.data instanceof Object

readPropertyFromRecord = (property, record)->
  record.data.property
