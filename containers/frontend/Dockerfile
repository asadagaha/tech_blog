ARG APP_HOME=/usr/src/app

FROM node:14.17 AS stg
ARG APP_HOME
RUN mkdir $APP_HOME
WORKDIR ${APP_HOME}

COPY ./react ${APP_HOME}
RUN yarn install
RUN yarn build

ENV PORT 80

CMD ["npm", "start"]

FROM nginx:alpine AS prd
ARG APP_HOME
COPY --from=stg ${APP_HOME}/build /var/www
COPY ./nginx /etc/nginx/conf.d/

WORKDIR /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]