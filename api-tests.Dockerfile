FROM node:alpine

RUN npm install -g dredd
ENTRYPOINT [ "dredd" ]
