FROM node
WORKDIR /brave-app
COPY package*.json .
RUN npm install
COPY . .
ENTRYPOINT ["npm"]
CMD ["node", "server.js"]
