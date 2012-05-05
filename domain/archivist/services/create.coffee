create = (data, archive, callback) ->
	created = archive.create(data)
	callback(created)
	created


module.exports = create
