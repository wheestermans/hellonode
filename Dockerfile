# Use a node v9 base image
FROM node:9

# set maintainer
LABEL maintainer "walter.heestermans@external.toyota-europe.com"

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
RUN npm config set registry "http://registry.npmjs.org/" && npm config set proxy http://150.45.87.133:8080 && npm install && npm cache clean --force
COPY . /usr/src/app

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000

# start nodejs
CMD [ "npm", "start" ]
