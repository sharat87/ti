default: tests

tests:
	cram test

up: tests
	scp -r site/* wf:~/webapps/ti_project/
