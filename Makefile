test:
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/archivist/{{models/*,services}/specs,integration}/*.coffee

.PHONY: test
