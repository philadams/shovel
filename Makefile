build:
	python setup.py build

clean:
	# Remove the build
	sudo rm -rf build dist
	# And all of our pyc files
	find . -name '*.pyc' | xargs -n 100 rm
	# And lastly, .coverage files
	find . -name .coverage | xargs rm

.PHONY: test
test:
	rm -rf .coverage
	nosetests --exe --cover-package=shovel --with-coverage --cover-branches -v

install: build
	python setup.py install
