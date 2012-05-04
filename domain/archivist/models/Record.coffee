class Record
	constructor: (@id, data) ->
		@setProperty key, value for key, value of data

	setProperty: (property, value) ->
		@["#{property}"] = value

module.exports = Record
