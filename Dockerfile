FROM suse/sles12sp1:latest
MAINTAINER cledorze <cledorze@suse.com>

ADD run.sh /run.sh
COPY webapp /srv/www/htdocs
