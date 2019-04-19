FROM node:8.11-stretch

ENV APP_ROOT /usr/src/app

WORKDIR $APP_ROOT

COPY package.json $APP_ROOT

RUN \
  echo 'npm install' && \
  npm install

COPY . $APP_ROOT

EXPOSE  3000

CMD ["npm", "run","start"]