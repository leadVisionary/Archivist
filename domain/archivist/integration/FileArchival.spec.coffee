Archivist = require '../Archivist'
FileArchive = require './mocks/FileArchive'
createData = require './mocks/createData'
fs = require 'fs'
require 'should'

describe 'When adding an archive to a file', ->
	describe '#create', ->
		it 'that file should be successfully created, with a record in it', ->
			data = createData()
			fileLocation = './domain/archivist/integration/mocks/dummy.txt'
			archive = new FileArchive(fileLocation)
			created = archive.create(data, ->)
			created.name.should.eql "Boogie"
			resultFile = fs.readFileSync fileLocation
			resultFile.should.exist
