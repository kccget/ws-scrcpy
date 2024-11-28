FROM node:16-alpine
WORKDIR /app
RUN npm config set registry http://mirrors.cloud.tencent.com/npm/
RUN npm install -g node-gyp
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add android-tools make g++
COPY . .
RUN npm install
RUN npm run dist
EXPOSE 8000
CMD ["node","dist/index.js"]