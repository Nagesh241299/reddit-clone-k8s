FROM node:18
WORKDIR /app
COPY app/ .
RUN npm init -y && npm install express
CMD ["node", "server.js"]
