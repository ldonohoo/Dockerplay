# build step
FROM node:20 AS node-builder
RUN mkdir /build
WORKDIR /build
COPY  package*.json ./
RUN npm ci
COPY . .


# # production step
# FROM alpine:3.19
# RUN apk add --update nodejs 
# # && because want this in one layer conceptually...
# RUN addgroup -S node && adduser -S node -G node
# USER node 
# RUN mkdir /home/node/code
# WORKDIR /home/node/code
# # copy package.json and package-lock.json
# #  (split the copy into two so we can just run npm install in earlier layer)
# COPY --from=node-builder --chown=node:node /build . 
# CMD ["node", "index.js"]

# multi-stage here...
# # build stage
# FROM node:20 AS node-builder
# WORKDIR /build
# COPY package-lock.json package.json ./
# RUN npm ci
# COPY . .

# # runtime stage
# FROM gcr.io/distroless/nodejs20
# COPY --from=node-builder --chown=node:node /build /app
# WORKDIR /app
# CMD ["index.js"]