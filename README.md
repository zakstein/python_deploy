# Python deployment template

A template to deploy apps with docker, nginx, uwsgi, and flask.

Intantiate the docker with:

	docker build -t python_app .

Deploy with following command:

	docker run --name python_app_instance -p 80:80 -i -t python_app

