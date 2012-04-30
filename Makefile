test:
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/archivist/models/specs/*.coffee
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/archivist/services/specs/*.coffee
	./node_modules/.bin/mocha --reporter list --compilers coffee:coffee-script domain/archivist/integration/*.coffee
	
.PHONY: test
