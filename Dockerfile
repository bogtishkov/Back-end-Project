FROM node:15-alpine AS builder
WORKDIR /app
COPY /*.json ./
COPY . .
RUN npm run build 

FROM node:15-alpine 
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 3001
CMD ["npm", "run", "start:prod"]