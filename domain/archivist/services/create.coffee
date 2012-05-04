create = (data, archive, callback) ->
	created = archive.create(data)
	callback(created)
	return created


module.exports = create
