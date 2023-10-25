# Build phase
FROM node:21-alpine as builder
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
# Copy the files from build phase and use Nginx to serve the static files
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html/

