FROM bucharestgold/centos7-s2i-nodejs:6.x

ENV RUBY_VERSION 2.4
ENV ANGULAR_CLI_VERSION 1.0.0

USER root

# To use subscription inside container yum command has to be run first (before yum-config-manager)
# https://access.redhat.com/solutions/1443553
RUN yum install -y centos-release-scl && \
    yum-config-manager --enable centos-sclo-rh-testing && \
    INSTALL_PKGS="rh-ruby24 rh-ruby24-ruby-devel rh-ruby24-rubygem-rake rh-ruby24-rubygem-bundler rh-nodejs6" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && rpm -V $INSTALL_PKGS && \
    yum clean all -y

# prepare a user which runs everything locally! - required in child images!
RUN useradd --user-group --create-home --shell /bin/false app

#ENV HOME=/opt/app-root/src
#WORKDIR $HOME

RUN npm install -g @angular/cli@$ANGULAR_CLI_VERSION >/dev/null 2>&1 && npm cache clean

# Copy the S2I scripts from the specific language image to $STI_SCRIPTS_PATH
COPY ./s2i/ $STI_SCRIPTS_PATH

USER 1001