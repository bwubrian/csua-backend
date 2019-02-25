#!/bin/bash
# prod_deploy.sh
# should be run with root permissions
HERE=$(dirname $0)
sudo -u www-data git -C $HERE pull origin master \
	&& sudo -u www-data $HERE/test.sh \
	&& sudo -u www-data $HERE/prod_migrate.sh \
	&& systemctl reload csua-backend-gunicorn \
	&& echo "Reloaded csua-backend"