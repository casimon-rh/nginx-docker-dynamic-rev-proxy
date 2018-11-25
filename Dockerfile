FROM nginx:alpine
WORKDIR /usr/src/app
COPY . .
EXPOSE 80
ENTRYPOINT [ "/bin/sh","entrypoint.sh" ]