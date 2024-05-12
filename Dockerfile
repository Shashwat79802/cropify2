# Use the official MySQL 5.7 image as the base image
FROM mysql:5.7

# Environment variables
ENV MYSQL_ROOT_PASSWORD abcd79802
ENV MYSQL_DATABASE forum_db
ENV MYSQL_PASSWORD abcd79802

# Expose port 3306
EXPOSE 3306

# Define volumes
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql
