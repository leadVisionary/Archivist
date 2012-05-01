Archive = require '../../../models/Archive'

class MemoryArchive extends Archive
	create: (data) -> 
		return super data
	
	read: (id) ->
		return super id

	update: () ->

	delete: () _>

module.exports = MemoryArchive
		
