class Record
	constructor: (@id, data) ->
		@setProperty key, value for key, value of data

	setProperty: (property, value) ->
		console.log "property was #{property}, value was #{value}"
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
