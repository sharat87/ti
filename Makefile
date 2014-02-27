SHELL := /bin/bash

PYENV := source .pyenv/bin/activate

.PHONY: default tests itests serve-site gen-site

default: tests

tests:
	cram test

itests:
	cram -i test

serve-site:
	cd site && pygreen serve

gen-site:
	${PYENV} && cd site && pygreen gen build
	${PYENV} && ghp-import -n site/build
	rm -r site/build
