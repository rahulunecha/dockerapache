# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package repository and install Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Expose port 80 to the outside world
WORKDIR /var/www/html
EXPOSE 80

# Copy the static fashion app files to the Apache server directory
COPY fashion/2127_little_fashion/ /var/www/html/

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
