FROM node:10.16.0-alpine

WORKDIR /source/github-action-example-node

COPY package.json /source/github-action-example-node

RUN cd /source/github-action-example-node && npm i --only=production

COPY . .

EXPOSE 3000
CMD ["sh", "-c", "node server.js"]