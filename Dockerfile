FROM node:18

WORKDIR /admin

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build
RUN npx prisma generate

EXPOSE 3000
CMD yarn prisma migrate deploy && yarn start
