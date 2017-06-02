FROM bucharestgold/centos7-s2i-nodejs:7.x

ENV ANGULAR_CLI_VERSION latest

RUN npm install -g @angular/cli@$ANGULAR_CLI_VERSION

# Copy the S2I scripts from the specific language image to $STI_SCRIPTS_PATH
#COPY ./s2i/bin/ $STI_SCRIPTS_PATH
