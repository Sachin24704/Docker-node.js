# multi stage build

# stage-1

FROM node:18 AS builder

WORKDIR /build

COPY package*.json .
RUN npm install

COPY /src /src
COPY tsconfig.json .

RUN npm run build

# stage-2 

FROM node:18 AS runner

WORKDIR /app

COPY --from=builder build/dist /dist
COPY --from=builder build/package*.json .
COPY --from=builder build/node_modules /node_modules

CMD ["npm","start"]





