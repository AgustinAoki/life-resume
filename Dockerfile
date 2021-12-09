FROM node:16

WORKDIR /app

COPY ./src/ /app/src/

COPY . /app/

RUN npm install

RUN npm run build

EXPOSE 3000

CMD [ "npm", "start" ]
