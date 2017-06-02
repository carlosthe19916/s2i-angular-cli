FROM bucharestgold/centos7-s2i-nodejs

USER root

# Install angular-cli
RUN npm install -g @angular/cli

RUN set -ex ; \
  /opt/app-root/etc/install_node.sh ; \
  /opt/app-root/etc/set_passwd_permissions.sh ; \
  chown -R 1001:0 /opt/app-root && chmod -R ug+rwx /opt/app-root

USER 1001

# Copy the S2I scripts from the specific language image to $STI_SCRIPTS_PATH
COPY ./s2i/ $STI_SCRIPTS_PATH
