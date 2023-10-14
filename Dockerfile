# Use an official PHP image as the base image.
FROM php:7.4-apache

RUN amazon-linux-extras install -y docker
# Install required extensions and dependencies.
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set working directory.
WORKDIR /var/www/html

# Copy your application files into the Docker image.
COPY . .

# Expose port 80 for the web server.
EXPOSE 80

# Start the Apache web server.
CMD ["apache2-foreground"]
