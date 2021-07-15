FROM node:alpine

USER node
RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY --chown=node:node ./package.json ./

COPY --chown=node:node ./.babelrc ./
 
RUN npm install
COPY --chown=node:node ./ ./
 


FROM nginx:alpine
EXPOSE 80
COPY --from=0 /home/node/app/build /usr/share/nginx/html