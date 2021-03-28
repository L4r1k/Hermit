FROM php:8.0.3-apache

ENV APP_HOME /var/www/html
WORKDIR ${APP_HOME}

# Update then install openssh-server and sudo
# Then disable history and unset the history file for all users to avoid cheating
# Finally, add the sudo GTFOBin vuln that allows reading of the root flag
RUN apt update; \
        apt install openssh-server sudo -y; \
        echo "set +o history;unset HISTFILE" >> /etc/profile; \
        echo "set +o history;unset HISTFILE" >> /etc/bash.bashrc; \
        useradd -m hermit; usermod -aG sudo hermit; \
        chmod 444 /etc/sudoers; \
        echo "hermit ALL = (root) NOPASSWD: /bin/gzip -f /root/rootflag.txt -t" >> /etc/sudoers

# Copy Files
COPY ./app ${APP_HOME}
COPY ./hermit/ /home/hermit/
COPY ./root /root/ 
COPY ./entrypoint.sh /entrypoint.sh
COPY ./start-apache /usr/local/bin

# Make scripts executable
RUN chmod +x /root/grim-reaper.sh; \
        chmod +x /entrypoint.sh; \
        chmod 755 /usr/local/bin/start-apache

# Web App Perms
RUN chmod -R a-w,a+rX /var/www/html; \
        chmod a+w /var/www/html/uploads

# Root Flag Perms
RUN chown root:root /root/rootflag.txt; \
        chmod 400 /root/rootflag.txt

# Hermit Perms
# Create a sticky bit protected directory with userflag in it to prevent deletions of the userflag by hermit user
RUN chown -R hermit:hermit /home/hermit; \
        chown -R hermit:hermit /var/www/html; \
        chown -R root:root /home/hermit/flag; \
        chmod 1775 /home/hermit/flag; \
        chmod 004 /home/hermit/flag/userflag.txt

EXPOSE 80 22
ENTRYPOINT ["/entrypoint.sh"]
CMD ["start-apache"]