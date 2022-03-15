FROM node:14 as build-stage
WORKDIR /roshan-react
COPY package.json ./
COPY package-lock.json ./
RUN npm install
RUN npm i
COPY . .
RUN npm run build

FROM nginx:1.15
COPY --from=build-stage /roshan-react/build/ /usr/share/nginx/html 
EXPOSE 80
