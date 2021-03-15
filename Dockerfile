FROM php:8.0.3-apache

ENV APP_HOME /var/www/html
WORKDIR ${APP_HOME}

RUN apt update
RUN apt install openssh-server less sudo -y
RUN useradd -m hermit; usermod -aG sudo hermit 
RUN chmod 444 /etc/sudoers
RUN echo "hermit ALL = (root) NOPASSWD: /usr/bin/less /home/hermit/sudo-backup.sh, /bin/less /home/hermit/sudo-backup.sh, /bin/less sudo-backup.sh" >> /etc/sudoers

COPY ./app ${APP_HOME}
COPY ./hermit/ /home/hermit/
COPY ./rootflag.txt /root/rootflag.txt
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY ./start-apache /usr/local/bin
RUN chmod 755 /usr/local/bin/start-apache

# Web App Perms
RUN chmod -R a-w,a+rX /var/www/html
RUN chmod a+w /var/www/html/uploads

# Root Flag Perms
RUN chown root:root /root/rootflag.txt
RUN chmod 400 /root/rootflag.txt

# Hermit Perms
RUN chown -R hermit:hermit /home/hermit
RUN chown -R hermit:hermit /var/www/html
RUN chmod 400 /home/hermit/userflag.txt
RUN chmod +x /home/hermit/sudo-backup.sh

EXPOSE 80 22
ENTRYPOINT ["/entrypoint.sh"]
CMD ["start-apache"]