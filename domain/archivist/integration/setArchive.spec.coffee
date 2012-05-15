fs = require 'fs'
require 'should'

Setup = require './setup'

describe 'Archivist', ->
        describe '#setArchive', ->
                it 'should allow the archive to be set at run-time', ->
                        # Given an Archivist and a new archive to set
                        archie = Setup.archivistFactory()
                        archive = new Setup.FileArchive(Setup.fileLocation)
                        # When I dynamically set its archive and try to create a new record
                        archie.setArchive(archive)
                        created = archie.create(Setup.data)
                        # Then the record should be persisted in the new archive
                        created.name.should.eql "Boogie"
                        resultFile = fs.readFileSync Setup.fileLocation
                        resultFile.should.exist

