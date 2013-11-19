SHELL := /bin/bash

.PHONY: default tests itests serve-site gen-site

default: tests

tests:
	cram test

itests:
	cram -i test

serve-site:
	cd site && pygreen serve

gen-site:
	cd site && pygreen gen build
	ghp-import -n site/build
