FROM node:14.17.0 as build
WORKDIR /app
COPY package.json package-lock.json yarn.lock /app/
RUN yarn 
COPY . /app/
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=build /app/dist/shell /usr/share/nginx/html
