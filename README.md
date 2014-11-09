# Python deployment template

A template to deploy apps with docker, nginx, uwsgi, and flask.

## Deploying to AWS

Intantiate the docker with:

	docker build -t python_app .

Deploy with following command:

	docker run --name python_app_instance -p 80:80 -i -t python_app

The release zips don't work with AWS. To make them work, unzip and then run

	zip ../myapp.zip -r * .[^.]*

or

	git archive --format=zip HEAD > <archive_name>

in the folder

Then, use the management console or eb CLI to push

## Running a dev server

To start the server in dev with the media and static files, use

	uwsgi --http 0.0.0.0:8080 --ini uwsgi.ini --static-map /static=/Users/zstein/python_deploy/static --static-map /media=/Users/zstein/python_deploy/media


