FROM node:14.17.5-alpine3.14@sha256:3a17eae2c9ca1b0ebbece219c33d79d5eca464a456d3243fd3d8c16c7e01271c


WORKDIR /usr/src/app


COPY  . /usr/src/app/

RUN  yarn 

RUN yarn build

EXPOSE 3000
CMD [ "yarn", "start:prod" ]
