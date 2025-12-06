#!/bin/bash

# Pre-requisites installation
sudo apt update
sudo apt install -y python3-pip python3-venv nginx git zip unzip

# Setup Directory
mkdir -p /var/www/fastapi_app
cd /var/www/fastapi_app

# The following steps are handled by the CI/CD pipeline mostly, 
# but initial setup needs:

# 1. Transfer project files or initial clone.
# 2. Setup .env file
# echo "DATABASE_URL=postgresql+asyncpg://user:pass@localhost/dbname" > .env

# 3. Setup Systemd (after copying fastapi.service to /etc/systemd/system/)
# sudo cp fastapi.service /etc/systemd/system/
# sudo systemctl daemon-reload
# sudo systemctl start fastapi
# sudo systemctl enable fastapi

# 4. Configure Nginx (Optional, but recommended)
# Create /etc/nginx/sites-available/fastapi
# server {
#     listen 80;
#     server_name your_domain.com;
#     location / {
#         proxy_pass http://127.0.0.1:8001;
#         ...
#     }
# }
