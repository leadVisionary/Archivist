Record = require './Record'
class Archive
  @storage = []
  @id = 0
  constructor: (@name)->

  create: (data) ->
    @storage[@id++] = new Record(@id, data)

  read: (id) ->
    	return @storage[id]
  
  module.exports = Archive
	
