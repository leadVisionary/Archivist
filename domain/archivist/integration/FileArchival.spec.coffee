Archivist = require '../Archivist'
FileArchive = require './mocks/FileArchive'
createData = require './mocks/createData'
fs = require 'fs'
require 'should'

describe 'FileArchive', ->
	describe '#create', ->
		it 'record should persist to file', ->
			data = createData()
			fileLocation = './domain/archivist/integration/mocks/dummy.txt'
			archive = new FileArchive(fileLocation)
			archie = new Archivist()
			archie.setArchive(archive)
			created = archie.create(data, archive, ->)
			created.name.should.eql "Boogie"
			resultFile = fs.readFileSync fileLocation
			resultFile.should.exist
