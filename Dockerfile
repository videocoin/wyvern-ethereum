FROM node:10

RUN mkdir /code

WORKDIR /code

RUN npm install -g truffle

COPY . .

RUN yarn

RUN ./scripts/compile.sh

ENV CUSTPOM_PRIM_KEY ""
ENV CUSTOM_RPC ""

CMD ["bash"]