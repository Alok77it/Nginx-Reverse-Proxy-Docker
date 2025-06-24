# Use the official nginx lightweight base image
FROM nginx:alpine

# Set the working directory in the container
WORKDIR /etc/nginx

# Copy your custom nginx.conf to the container's config directory
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 (used inside Docker for Nginx)
EXPOSE 80

# Start Nginx in the foreground so the container doesn't exit
CMD ["nginx", "-g", "daemon off;"]
