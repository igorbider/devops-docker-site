FROM nginx:alpine

# Copy website
COPY index.html /usr/share/nginx/html/index.html

# Copy nginx config
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Healthcheck (Docker checks container is healthy)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost/healthz || exit 1
