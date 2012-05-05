Record = require './Record'

class Archive
  constructor: (@name, @storage=[])->

  create: (data) ->
    newId = @generateId()
    console.log newId
    record = new Record(newId, data)
    @storage.push(record)
    return record

  read: (id) ->
    return @find(id)

  update: (id, data) ->
    toUpdate = @find(id)
    toUpdate.setProperty(key, value) for key, value of data
    return toUpdate

  remove: (id) ->
    toDelete = @find(id)
    @storage.splice(toDelete.id-1, 1)
    return toDelete

  getSize: () -> @storage.length

  generateId: () -> @getSize() + 1

  find:(id) ->
    result = record for record in @storage when record.id is id
    return result
  
module.exports = Archive
