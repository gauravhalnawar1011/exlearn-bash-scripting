FROM node:alpine

WORKDIR  /app 

COPY .  .

RUN yarn remove uuid

RUN yarn add uuid@8.3.2
RUN yarn install --production


EXPOSE 3000 

CMD ["node", "src/index.js"]
