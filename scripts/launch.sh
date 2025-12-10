#!/bin/bash

echo "Building docker..."
docker compose up --build -d

echo "Execute the container"
docker compose exec lal-build bash
