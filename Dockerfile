FROM nginx:alpine

# Remove default nginx site
RUN rm -rf /usr/share/nginx/html/*

# Copy your built site into nginx webroot
COPY dist/ /usr/share/nginx/html/

EXPOSE 3000

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]