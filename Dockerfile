FROM node:18

WORKDIR /admin

ENV TZ="UTC"

COPY package.json ./
COPY yarn.lock ./

RUN yarn install --frozen-lockfile --production
COPY . .

RUN npm i -g typescript
RUN yarn build
RUN npx prisma generate

ENV ADMIN_JS_SKIP_BUNDLE="true"

EXPOSE 3000
CMD yarn prisma migrate dev --schema prisma/schema.prisma && yarn start


