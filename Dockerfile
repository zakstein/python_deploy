from ubuntu

maintainer zakstein@gmail.com

run echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe" > /etc/apt/sources.list
run apt-get update
run apt-get install -y build-essential git
run apt-get install -y python python-dev python-setuptools
run apt-get install -y nginx supervisor
run easy_install pip

run pip install uwsgi

run apt-get install -y python-software-properties
run apt-get update
run add-apt-repository -y ppa:nginx/stable

add . /home/docker/code/

run echo "daemon off'" >> /etc/nginx/nginx.conf

run rm /etc/nginx/sites-enabled/default
run ln -s /home/docker/code/conf/nginx-app.conf /etc/nginx/sites-enabled/
run ln -s /home/docker/code/conf/supervisor-app.conf /etc/supervisor/conf.d/

run pip install -r /home/docker/code/app/requirements.txt

expose 80
