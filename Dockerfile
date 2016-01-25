FROM suse/sles12:latest
MAINTAINER cledorze <cledorze@suse.com>
ADD http://sle11sp3-1.dorz.fr/smt.crt /etc/pki/trust/anchors/smt.crt
RUN update-ca-certificates

########### REPOS / EXPERTISE ###############
#RUN zypper ar http://sle11sp3-1.dorz.fr/repo/SUSE/Products/SLE-Module-Web-Scripting/12/x86_64/ SLE12-WS
#RUN zypper ar http://sle11sp3-1.dorz.fr/repo/SUSE/Products/SLE-Module-Containers/12/x86_64/ SLE12-DK
RUN zypper ar http://172.17.2.219/repo/SUSE/Products/SLE-SERVER/12/x86_64/product SLE-ALL
RUN zypper ref -s

########### PACKAGES / EXPERTISE prequis DEV ###########
RUN zypper -n in apache2 php5 php5-mysql apache2-mod_php5  php5-gd php5-gettext php5-mbstring php5-pear php5-curl php5-suhosin
RUN zypper clean

########### DEV ###############
RUN sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/g' /etc/php5/apache2/php.ini
ADD run.sh /run.sh
#ADD apache2-sysconfig /etc/sysconfig/apache2
COPY /webapp/* /srv/www/htdocs/

########### DEV #################
#CMD /usr/sbin/httpd2-prefork && tail -f /var/log/apache2/*log
CMD /usr/sbin/start_apache2 && tail -f /var/log/apache2/*log
#CMD /run.sh
