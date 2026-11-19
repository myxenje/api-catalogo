FROM public.ecr.aws/docker/library/node:20-alpine
WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .
RUN sed -i 's/\r$//' docker/entrypoint.sh && chmod +x docker/entrypoint.sh

ENV NODE_ENV=production
EXPOSE 3000

ENTRYPOINT ["/app/docker/entrypoint.sh"]