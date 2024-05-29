FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=senha123
ENV MYSQL_DATABASE=fitairline
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=senhaadmin321

COPY ./mysql_script /docker-entrypoint-initdb.d