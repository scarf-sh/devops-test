# Use a lightweight web server as the base image
FROM nginx:alpine

# Remove the default Nginx configuration file
#RUN rm /etc/nginx/conf.d/default.conf

# Copy your index.html to the Nginx web root directory
COPY ./src/index.html /usr/share/nginx/html

# Expose the port on which Nginx is listening (default is 80)
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]