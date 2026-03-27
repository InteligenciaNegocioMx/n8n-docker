FROM n8nio/n8n:latest

# Render uses PORT env var
ENV N8N_PORT=${PORT:-5678}
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=America/Mexico_City

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD wget -qO- http://localhost:${N8N_PORT}/healthz || exit 1

EXPOSE ${N8N_PORT}
