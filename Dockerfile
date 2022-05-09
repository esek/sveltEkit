FROM node:latest as builder

WORKDIR /app

COPY . .

RUN yarn install --frozen-lockfile
RUN yarn build

FROM node:latest

WORKDIR /app

COPY --from=builder /app/package.json /app/yarn.lock ./
COPY --from=builder /app/build ./

RUN yarn install --frozen-lockfile --production

EXPOSE 3000

CMD ["node", "./index.js"]