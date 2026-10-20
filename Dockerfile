FROM node:22-bookworm-slim
WORKDIR /app
COPY package.json ./
RUN npm install --omit=dev --no-audit --no-fund
COPY server ./server
COPY scripts ./scripts
COPY www ./www
ENV NODE_ENV=production HOST=0.0.0.0 PORT=3000 DB_PATH=/data/ribera.sqlite
RUN mkdir -p /data /backups && chown -R node:node /app /data /backups
USER node
EXPOSE 3000
CMD ["node","server/server.mjs"]
