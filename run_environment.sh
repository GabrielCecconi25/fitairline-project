#!/bin/bash

echo "Creating image..."
sudo docker build -t fitairline/mysql .

echo "Creating container..."
sudo docker run -d -p 3306:3306 --name fitairline-mysql fitairline/mysql

echo "Connect using localhost:3306"