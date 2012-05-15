Archivist = require '../Archivist'
FileArchive = require './mocks/FileArchive'
createData = require './mocks/createData'

data = createData()
fileLocation = './domain/archivist/integration/mocks/another.txt'

archiveFactory = () ->
	new FileArchive(fileLocation)

archivistFactory = () ->
        archive = archiveFactory(fileLocation)
        archie = new Archivist(archive)

module.exports.data = data
module.exports.archivistFactory = archivistFactory
module.exports.archiveFactory = archiveFactory
module.exports.fileLocation = fileLocation
