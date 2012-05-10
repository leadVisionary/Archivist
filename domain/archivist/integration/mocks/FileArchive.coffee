Archive = require '../../models/Archive'
fs = require 'fs'

class FileArchive extends Archive
	constructor: (@archive='dummy.txt') ->
		@createFile()
		super()
	
	createFile: () ->
		fs.writeFileSync(@archive, '')
	
	create: (data) ->
		record = super(data)
		toWrite = fs.createWriteStream(@archive, {'flags':'a'})
		toWrite.write(record)
		record

	read: (id)-> super(id)

	update: (id, data) ->
		super(id, data)
	
	delete: (id) ->
		super(id)

module.exports = FileArchive
