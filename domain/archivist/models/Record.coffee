class Record
	constructor: (@id, data) ->
		console.log "in constructor so fuck"
		setProperty key, value for own key, value of data

	setProperty: (property, value) -> 
		console.log "property was #{property}, value was #{value}"
		@property = value