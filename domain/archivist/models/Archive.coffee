Record = require './Record'

class Archive
  constructor: (@name, @id = 0, @storage = [])->

  create: (data) ->
    @storage[@id++] = new Record(@id, data)

  read: (id) ->
    return @storage[id]

  update: (id, data) ->
  	toUpdate = @storage[id]
  	toUpdate.setProperty key, value for own key, value of data
  	return toUpdate

  remove: (id) ->
  	toDelete = @storage[id]
  	@storage[id] = null
  	return toDelete
  
  getSize: () -> @id
  
module.exports = Archive
	
