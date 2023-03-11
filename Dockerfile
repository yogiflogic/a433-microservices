FROM node:14.21.3-alpine3.17

WORKDIR /app

COPY . .

ENV NODE_ENV=production DB_HOST=item-db

RUN npm install --production --unsafe-perm && npm run build

EXPOSE 8080

CMD [ "start", "npm" ]
