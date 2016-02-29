FROM mhart/alpine-node:5.5.0

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package.json /usr/src/app/package.json

RUN npm install

COPY . /usr/src/app

ARG VERSION=dev
ENV VERSION ${VERSION}

RUN npm run compile:prod

CMD npm run prod
