FROM mhart/alpine-node:13.8

# Creat app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install --only=production

# Copy the actual app's code
COPY . .

EXPOSE 3000


# in Docker-compose add
# web:
#     build: ./nodeapp
#     restart: unless-stopped
#     image: #docker image of the node app
#     container_name: my-app
#     command: npm start #or node index.js, etc
#     depends_on:
#       - postgres
#     environment:
#       DATABASE_URL: postgres://my-db@postgres/my-db
#       NODE_ENV: production
#       VIRTUAL_HOST: api.codedevstack.com
#       LETSENCRYPT_HOST: api.codedevstack.com
#       LETSENCRYPT_EMAIL: myemail@gmail.com
