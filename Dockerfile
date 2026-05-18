FROM node:20-alpine

RUN npm install -g pnpm

WORKDIR /app

ENV NODE_ENV=production

COPY package*.json ./
COPY pnpm-lock.yaml ./

RUN pnpm install --frozen-lockfile --prod

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]