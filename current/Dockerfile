FROM ryanj/centos7-s2i-nodejs:current

RUN npm install -g angular-cli

# Copy the S2I scripts from the specific language image to $STI_SCRIPTS_PATH
COPY ./s2i/bin/ $STI_SCRIPTS_PATH
