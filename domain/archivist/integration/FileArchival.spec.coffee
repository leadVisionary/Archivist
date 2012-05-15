Archivist = require '../Archivist'
FileArchive = require './mocks/FileArchive'
createData = require './mocks/createData'
fs = require 'fs'
require 'should'

archivistFactory = () ->
	fileLocation = './domain/archivist/integration/mocks/dummy.txt'
	archive = new FileArchive(fileLocation)
	archie = new Archivist(archive)


describe 'Archivist', ->
	describe '#setArchive', ->
		it 'should allow the archive to be set at run-time', ->
			data = createData()
			archie = archivistFactory()
			fileLocation = './domain/archivist/integration/mocks/another.txt'
			archive = new FileArchive(fileLocation)
			archie.setArchive(archive)
			created = archie.create(data)
			created.name.should.eql "Boogie"
			resultFile = fs.readFileSync fileLocation
			resultFile.should.exist

	describe '#create', ->
		it 'record should persist to file', ->
			data = createData()
			fileLocation = './domain/archivist/integration/mocks/dummy.txt'
			archie = archivistFactory()
			created = archie.create(data)
			created.name.should.eql "Boogie"
			resultFile = fs.readFileSync fileLocation
			resultFile.should.exist
