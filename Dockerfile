FROM node:15-alpine
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .
RUN npm run build-prod
ENTRYPOINT ["sh", "./run.sh"]
