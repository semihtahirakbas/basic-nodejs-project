# 1. Base image
FROM node:22-alpine

# 2. Workdir inside container
WORKDIR /usr/src/app

# 3. Copy package files first (better cache)
COPY package*.json ./

# 4. Install deps (no dev deps -> optional)
RUN npm install --omit=dev

# 5. Copy source
COPY . .

# 6. App listens on 3000 (from your code)
EXPOSE 3000

# 7. Run
CMD ["node", "index.js"]