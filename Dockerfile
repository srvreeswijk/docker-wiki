FROM node:8-slim
MAINTAINER Sebastiaan Vreeswijk s.vreeswijk@gmail.com

ENV RANETO_VERSION 0.16.0
ENV RANETO_INSTALL_DIR /opt/raneto

# Get Raneto from sources
RUN cd /tmp \
    && curl -SLO "https://github.com/gilbitron/Raneto/archive/$RANETO_VERSION.tar.gz" \
    && mkdir -p $RANETO_INSTALL_DIR \
    && tar -xzf "$RANETO_VERSION.tar.gz" -C $RANETO_INSTALL_DIR --strip-components=1 \
    && rm "$RANETO_VERSION.tar.gz"

# Installing dependencies
RUN npm i npm@latest -g
RUN npm install --global gulp-cli pm2

# Entering into the Raneto directory
WORKDIR $RANETO_INSTALL_DIR

# Installing Raneto
RUN npm install \
    && rm -f $RANETO_INSTALL_DIR/example/config.default.js \
    && gulp

# Exposed the raneto default port 3000
EXPOSE 3000

# Starting the raneto
CMD [ "pm2", "start", "/opt/raneto/example/server.js", "--name", "raneto", "--no-daemon" ]