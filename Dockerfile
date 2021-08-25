FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# nginx stage while dumping all the stuffs from the builder stage
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
