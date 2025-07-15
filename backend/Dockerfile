FROM node:22-alpine

RUN addgroup -S app && adduser -S -G app app
RUN apk add --no-cache tini

WORKDIR /app

COPY package* .

# 4. Install *production-only* dependencies
ENV NODE_ENV=production
RUN npm ci --omit=dev

COPY . .

EXPOSE 5000

ENTRYPOINT ["/sbin/tini", "--"]
USER app

# 8. Start the server
CMD ["node", "index.js"]