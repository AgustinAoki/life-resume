FROM node:16

RUN apk add tzdata && \
  apk --no-cache add curl && \
  apk --no-cache add bash && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
  echo $TZ > /etc/timezone

WORKDIR /app

COPY ./src/ /app/src/

RUN npm install && npm run build

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]
