FROM node:lts-alpine

RUN yarn create koishi koishi-app -y && cd koishi-app && \
    sed -i 's/host: .*/host: 0.0.0.0/g' koishi.yml && \
    yarn install && sha256sum /koishi-app/node_modules/go-cqhttp/bin/go-cqhttp

WORKDIR /koishi-app

ENTRYPOINT [ "yarn", "start" ]
