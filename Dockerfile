FROM node:10
ARG BUILD_NUMBER
#ENV BUILD_NUMBERSEND $BUILD_NUMBER

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
COPY . .
RUN echo "$BUILD_NUMBER"
RUN sed "s/JENKINSBUILD/$BUILD_NUMBER/g" ./server.js > ./server.js.ok
RUN rm -f ./server.js
RUN mv ./server.js.ok ./server.js
# Bundle app source


EXPOSE 8080
#ENTRYPOINT [ "node", "server.js" ]
CMD [ "node", "server.js" ]