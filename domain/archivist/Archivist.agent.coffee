Archive = require './models/Archive'
ArchivalStrategy = require './models/ArchivalStrategy'
create = require './services/create'
read = require './services/read'
update = require './services/update'
delete = require './services/delete'
 
class Archivist
	setArchive: (location) -> @archive = location
  	setStorageStrategy: (strategy) -> @strategy = strategy

  	create: (data) -> create(data, @archive, @strategy)
  	read: (id) -> read(id, @archive)
  	update: (id, newData) -> update(id, @archive, newData)
  	delete : (id) -> delete(id, @archive)

module.exports = Archivist