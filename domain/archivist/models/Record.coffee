class Record
	constructor: (@id, data) ->
    @addProperties data

  addProperties: (data)->
    @setProperty key, value for own key, value of data

	setProperty: (property, value) ->
		@["#{property}"] = value

module.exports = Record
