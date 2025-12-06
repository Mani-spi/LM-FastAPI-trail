
#!/bin/bash

# Define variables
USER="u123456789" # Replace with your Hostinger Username
PROJECT_DIR="/home/$USER/myapi"
PYTHON_VERSION="python3" # Ensure python3 is available (e.g. 3.10)

echo "Setting up FastAPI on Hostinger VPS..."

# 1. Create Project Directory
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Creating project directory: $PROJECT_DIR"
    mkdir -p "$PROJECT_DIR"
else
    echo "Project directory exists."
fi

# 2. Setup Virtual Environment
cd "$PROJECT_DIR"
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    $PYTHON_VERSION -m venv venv
else
    echo "Virtual environment already exists."
fi

# 3. Activate and Install Basic Deps
source venv/bin/activate
pip install --upgrade pip
pip install gunicorn uvicorn

echo "Environment setup complete."
echo "-----------------------------------------------------"
echo "NEXT STEPS:"
echo "1. Upload your code via Git or CI/CD."
echo "2. Create a .env file in $PROJECT_DIR with DATABASE_URL."
echo "   Example: echo 'DATABASE_URL=postgresql+asyncpg://user:pass@localhost/db' > .env"
echo "3. Copy the systemd service file to /etc/systemd/system/ (requires sudo/root)."
echo "   sudo cp fastapi.service /etc/systemd/system/fastapi.service"
echo "   sudo systemctl daemon-reload"
echo "   sudo systemctl enable fastapi.service"
echo "   sudo systemctl start fastapi.service"
echo "-----------------------------------------------------"
