test:
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/archivist/{{models,services}/specs,integration}/*.coffee

funky: integration models services

integration:
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/archivist/integration/*.coffee

services:
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/archivist/services/specs/*.coffee

models:
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/archivist/models/specs/*.coffee

.PHONY: test
