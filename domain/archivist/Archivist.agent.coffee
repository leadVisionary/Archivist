Archive = require './models/Archive'
ArchivalStrategy = require './models/ArchivalStrategy'
create = require './services/create'
read = require './services/read'
update = require './services/update'
delete = require './services/delete'
 
class Archivist
	setStorageLocation: (location) -> @archive = location
  	setStorageStrategy: (strategy) -> @strategy = strategy

  	create: (data) -> create(data, @archive, @strategy)
  	read: (id) -> read(id, @archive)
  	update: (id, newData) -> update(id, Archive, newData)
  	delete : (id) -> delete(id)

module.exports = Archivist