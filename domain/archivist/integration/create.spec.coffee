fs = require 'fs'
require 'should'

Setup = require './setup'

describe 'Archivist', ->
        describe '#create', ->
                it 'record should persist to file', ->
                        # Given an Archivist
                        archie = Setup.archivistFactory()
                        # When I create a record with data
                        created = archie.create(Setup.data)
                        # Then the record should be created in the archive
                        created.name.should.eql "Boogie"
                        created.id.should.eql 1
                        resultFile = fs.readFileSync Setup.fileLocation
                        resultFile.should.exist

		it 'record should not persist to file when data does not validate', ->
			# Given an Archivist
			archie = Setup.archivistFactory()
			# And an archive with a validation scheme set
			validators = {"name": (data) -> data != "Boogie"}
			archive = Setup.archiveFactory()
			archive.setValidationStrategy(validators)
			archie.setArchive(archive)
			# When I create a record with data
		        # Then the record should throw an error
			creation = () ->
				archie.create(Setup.data)
			creation.should.throw()
