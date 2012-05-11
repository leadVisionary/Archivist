create = require './services/create'
read = require './services/read'
update = require './services/update'
remove = require './services/remove'
 
class Archivist
	setArchive: (location) -> @archive = location
	create: (data) ->
		create(data, @archive, @strategy= ->)
	read: (id) -> read(id, @archive)
	update: (id, newData) -> update(id, @archive, newData)
	remove: (id) -> remove(id, @archive)

module.exports = Archivist
