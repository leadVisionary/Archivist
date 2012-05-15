fs = require 'fs'
require 'should'

Setup = require './setup'

describe 'Archivist', ->
	describe '#read', ->
		it 'record should be readable from an id', ->
			# Given an Archivist
			archie = Setup.archivistFactory()
			# And some data already in the archive
			prePopulated = archie.create(Setup.data)
			# When I try to read by an id
			read = archie.read(1)
			# Then I should get back the record I was seeking
			prePopulated.should.eql read
		it 'record should be empty given that id does not exist', ->
			# Given an Archivist
			archie = Setup.archivistFactory()
			# And some data already in the archive
			prePopulated = archie.create(Setup.data)
			# When I try to read by an id
			read = archie.read(50)
			# Then I should get back an empty object
			read.should.exist
			read.keys?.should.not.be.ok
