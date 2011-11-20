default: tests

tests:
	cram test

up: tests
	scp -r site/* wf:~/webapps/ti_project/

serve:
	cd site && python -m SimpleHTTPServer 8080
