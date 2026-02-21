#!/usr/bin/env bash
# Additional setup script to be run inside the Docker container
# This script installs required packages and sets up the project environment

set -e  # exit on error

# Get the absolute path of the project directory
echo "🔧 Setting up project environment..."
PROJECT_DIR=$(realpath "$(dirname "$(pwd)")")
pip install -e "${PROJECT_DIR}[vllm_latest]" --no-deps

echo "✅ Setup complete!"