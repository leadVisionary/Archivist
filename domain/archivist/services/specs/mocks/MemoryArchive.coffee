Archive = require '../../../models/Archive'

class MemoryArchive extends Archive
	create: (data) -> 
		return super data
	
	read: (id) ->
		return super id

	update: (id, data) ->
		return super id,data

	delete: (id) ->
		return super id

module.exports = MemoryArchive
		
