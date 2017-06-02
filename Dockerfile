FROM bucharestgold/centos7-s2i-nodejs:7.x

# Copy the S2I scripts from the specific language image to $STI_SCRIPTS_PATH
COPY ./s2i/ $STI_SCRIPTS_PATH
