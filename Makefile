SHELL := /bin/bash

PYENV := source .pyenv/bin/activate

.PHONY: default tests itests serve-site gen-site

default: tests

tests:
	${PYENV} && cram test

itests:
	${PYENV} && cram -i test

deps:
	${PYENV} && pip install -r requirements.txt

serve-site:
	${PYENV} cd site && pygreen serve

gen-site:
	${PYENV} && cd site && pygreen gen build
	${PYENV} && ghp-import -n site/build
	rm -r site/build
