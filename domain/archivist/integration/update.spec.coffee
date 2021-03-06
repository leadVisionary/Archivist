fs = require 'fs'
require 'should'

Setup = require './setup'

describe 'Archivist', ->
	describe '#update', ->
		it 'record should be updated when given an existing id and new data', ->
			# Given an Archivist
			archie = Setup.archivistFactory()
			# And some data already in the archive
			prePopulated = archie.create(Setup.data)
			# When I try to read by an id
			updated = archie.update(1, {name:"Chompie"})
			# Then I should get back the record I was seeking
			updated.name.should.eql "Chompie"
		it 'record should not be updated given an id that does not exist', ->
			# Given an Archivist
			archie = Setup.archivistFactory()
			# And some data already in the archive
			prePopulated = archie.create(Setup.data)
			# When I try to read by an id
			updated = archie.update(50, {name:"frank"})
			# Then I should get back an empty object
			updated.should.exist
			updated.keys?.should.not.be.ok
		it 'record should not persist to file when data does not validate', ->
			# Given an Archivist
			archie = Setup.archivistFactory()
			# And an archive with a validation scheme set
			validators = {"name": (data) -> data != "Chompie"}
			archive = Setup.archiveFactory()
			archive.setValidationStrategy(validators)
			archie.setArchive(archive)
			archie.create(Setup.data)
			# When I try to update a record with invalid data
		        # Then the record should throw an error
			update = () ->
				archie.update(1, {name:"Chompie"})			
			update.should.throw()
