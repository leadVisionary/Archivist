Archivist = require '../Archivist'
FileArchive = require './mocks/FileArchive'
createData = require './mocks/createData'

data = createData()
fileLocation = './domain/archivist/integration/mocks/another.txt'
archivistFactory = () ->
        archive = new FileArchive(fileLocation)
        archie = new Archivist(archive)

module.exports.data = data
module.exports.archivistFactory = archivistFactory
module.exports.FileArchive = FileArchive
module.exports.fileLocation = fileLocation
