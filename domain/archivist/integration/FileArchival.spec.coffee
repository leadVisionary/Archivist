Archivist = require '../Archivist'
FileArchive = require './mocks/FileArchive'
createData = require './mocks/createData'
fs = require 'fs'
require 'should'


data = createData()
fileLocation = './domain/archivist/integration/mocks/another.txt'
archivistFactory = () ->
	archive = new FileArchive(fileLocation)
	archie = new Archivist(archive)


describe 'Archivist', ->
	describe '#setArchive', ->
		it 'should allow the archive to be set at run-time', ->
			# Given an Archivist and a new archive to set
			archie = archivistFactory()
			archive = new FileArchive(fileLocation)
			# When I dynamically set its archive and try to create a new record
			archie.setArchive(archive)
			created = archie.create(data)
			# Then the record should be persisted in the new archive
			created.name.should.eql "Boogie"
			resultFile = fs.readFileSync fileLocation
			resultFile.should.exist

	describe '#create', ->
		it 'record should persist to file', ->
			# Given an Archivist
			archie = archivistFactory()
			# When I create a record with data
			created = archie.create(data)
			# Then the record should be created in the archive
			created.name.should.eql "Boogie"
			created.id.should.eql 1
			resultFile = fs.readFileSync fileLocation
			resultFile.should.exist
	
	describe '#read', ->
		it 'record should be readable from an id', ->
			# Given an Archivist
			archie = archivistFactory()
			# And some data already in the archive
			prePopulated = archie.create(data)
			# When I try to read by an id
			read = archie.read(1)
			# Then I should get back the record I was seeking
			prePopulated.should.eql read
		it 'record should be empty given that id does not exist', ->
			# Given an Archivist
			archie = archivistFactory()
			# And some data already in the archive
			prePopulated = archie.create(data)
			# When I try to read by an id
			read = archie.read(50)
			# Then I should get back an empty object
			read.should.exist
			read.keys?.should.not.be.ok
