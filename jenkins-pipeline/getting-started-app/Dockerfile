# ==========================
# Stage 1 - Dependencies
# ==========================

FROM node:22-alpine AS builder

WORKDIR /app

RUN corepack enable

COPY package.json yarn.lock* ./

RUN yarn install --production

COPY . .

# ==========================
# Stage 2 - Runtime
# ==========================

FROM node:22-alpine

WORKDIR /app

RUN corepack enable

COPY --from=builder /app .

EXPOSE 3000

CMD ["node", "src/index.js"]
