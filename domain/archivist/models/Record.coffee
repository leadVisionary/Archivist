class Record
	constructor: (@id, data) ->
		@setProperty key, value for key, value of data

	setProperty: (property, value) ->
		console.log "property was #{property}, value was #{value}"
		@["#{property}"] = value

module.exports = Record
