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

