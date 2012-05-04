Record = require './domain/archivist/models/Record'
util = require 'util'

aRecord = new Record 0, {}

aRecord.setProperty 'foo', 'bar'

console.log util.inspect(aRecord, true)
