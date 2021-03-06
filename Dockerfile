# Download node image, equivalent to docker pull node
FROM node
# set working directory
WORKDIR /app
# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts -g --silent
# add app
COPY . ./
# expose app port number
EXPOSE 3000
# start app
CMD ["npm", "start"]