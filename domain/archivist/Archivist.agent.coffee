create = require './services/create'
read = require './services/read'
update = require './services/update'
remove = require './services/remove'
 
class Archivist
	constructor: (archive) -> @setArchive(archive)
	setArchive: (location) -> @archive = location
	create: (data) -> create(data, @archive)
	find: (id) -> @read(id)
	read: (id) -> read(id, @archive)
	update: (id, newData) -> update(id, @archive, newData)
	delete: (id) -> @remove(id)
	remove: (id) -> remove(id, @archive)

module.exports = Archivist
