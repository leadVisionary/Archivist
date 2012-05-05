Archive = require '../../../models/Archive'

class MemoryArchive extends Archive
	create: (data) -> super data
	
	read: (id) -> super id

	update: (id, data) -> super id,data

	remove: (id) -> super id

module.exports = MemoryArchive
		
