#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install Nginx
echo "Installing Nginx..."
sudo apt install nginx -y

# Enable and start Nginx service
echo "Enabling and starting Nginx service..."
sudo systemctl enable nginx
sudo systemctl start nginx
