Record = require './Record'

emptyArray = []

class Archive
  constructor: (@name, @id=0, @storage=emptyArray)->

  create: (data) ->
    record = new Record(@id, data)
    @id = @storage.push(record)
    return record

  read: (id) ->
    return @storage[id]

  update: (id, data) ->
    toUpdate = @storage[id]
    toUpdate.setProperty(key, value) for key, value of data
    return toUpdate

  remove: (id) ->
  	toDelete = @storage[id]
  	@storage[id] = null
  	return toDelete
  getSize: () -> return @id
  
module.exports = Archive
	
