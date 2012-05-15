fs = require 'fs'
require 'should'

Setup = require './setup'

describe 'Archivist', ->
	describe '#delete', ->
		it 'record should be deleted given a valid id', ->
			# Given an Archivist
			archie = Setup.archivistFactory()
			# And some data already in the archive
			prePopulated = archie.create(Setup.data)
			# When I try to delete by an id
			deleted = archie.delete(1)
			# Then I should get back the record I deleted
			prePopulated.should.eql deleted
			# And the record should no longer be there
			afterwards = archie.read(1)
			afterwards.should.exist
			afterwards.keys?.should.not.be.ok
		it 'record should be empty given that id does not exist', ->
			# Given an Archivist
			archie = Setup.archivistFactory()
			# And some data already in the archive
			prePopulated = archie.create(Setup.data)
			# When I try to read by an id
			deleted = archie.delete(50)
			# Then I should get back an empty object
			deleted.should.exist
			deleted.keys?.should.not.be.ok
