FROM node:20-alpine AS builder

WORKDIR /app


COPY package* .
RUN npm ci                                           # deterministic & faster than `npm install`

COPY . .

RUN npm run build                                    # outputs to /app/build by default


FROM nginx:1.27-alpine

RUN addgroup -S app && adduser -S -G app app && rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

RUN chown -R app:app /usr/share/nginx/html

# Pre‑create Nginx temp, log and run dirs for the unprivileged user
RUN mkdir -p /var/cache/nginx/client_temp /var/cache/nginx/proxy_temp \
    && mkdir -p /run /var/run /var/log/nginx \
    && chown -R app:app /run /var/cache/nginx /var/run /var/log/nginx

USER app

ENTRYPOINT ["nginx", "-g", "daemon off;"]