Record = require './Record'
require 'emptyObject'

class Archive
  constructor: (@name, @storage=[])->

  create: (data) ->
    newId = @generateId()
    record = new Record(newId, data, @validator)
    @storage.push(record)
    return record

  read: (id) ->
    return @find(id)

  update: (id, data) ->
    toUpdate = @find(id)
    toUpdate.setProperty(key, value) for own key, value of data when not toUpdate.isEmpty()

    return toUpdate

  delete: (id) ->
    @remove id

  remove: (id) ->
    toDelete = @find(id)
    @storage.splice(toDelete.id-1, 1)
    return toDelete

  find:(id) ->
    result = record for record in @storage when record.id is id
    return result or {}
  
  getSize: () -> @storage.length

  generateId: () -> @getSize() + 1

  setValidationStrategy: (validatorObject) ->
	  @validator = validatorObject

module.exports = Archive
