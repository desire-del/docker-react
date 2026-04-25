FROM node:16-alpine AS buider

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx:alpine

COPY --from=buider /app/build /usr/share/nginx/html

EXPOSE 80
