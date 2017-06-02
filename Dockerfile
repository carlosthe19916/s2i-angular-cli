FROM bucharestgold/centos7-s2i-nodejs:7.x

ENV ANGULAR_CLI_VERSION latest

USER root

# prepare a user which runs everything locally! - required in child images!
RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/opt/app-root/src
WORKDIR $HOME

RUN npm install -g @angular/cli@$ANGULAR_CLI_VERSION && npm cache clean

# Copy the S2I scripts from the specific language image to $STI_SCRIPTS_PATH
COPY ./s2i/ $STI_SCRIPTS_PATH

RUN set -ex ; \
  /opt/app-root/etc/install_node.sh ; \
  /opt/app-root/etc/set_passwd_permissions.sh ; \
  chown -R 1001:0 /opt/app-root && chmod -R ug+rwx /opt/app-root

USER 1001