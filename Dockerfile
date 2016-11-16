FROM 10.17.3.115:5000/devel/suse-sles12sp1:latest
MAINTAINER cledorze <cledorze@suse.com>

ADD run.sh /run.sh
COPY webapp /srv/www/htdocs
