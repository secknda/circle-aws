FROM node:16.10

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json package-lock.json ./
RUN npm install

# Bundle app source
COPY . .

# Build app
RUN npm run build

EXPOSE 80
CMD [ "npm", "start" ]
