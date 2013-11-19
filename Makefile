SHELL := /bin/bash

.PHONY: default tests itests

default: tests

tests:
	cram test

itests:
	cram -i test

siteserve:
	cd site && pygreen serve
