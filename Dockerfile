# this is my base image
FROM node:lts-alpine

WORKDIR /var/app
# install Python modules needed by the Python app
COPY ./*.json ./
RUN npm install

# copy files required for the app to run
COPY ./*.js ./

# tell the port number the container should expose
EXPOSE 3000

# run the application
CMD ["npm", "run", "start"]