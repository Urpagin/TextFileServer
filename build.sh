#!/bin/bash

# Change those two variables

CONTAINER_NAME=serve-text-file

PORT=8989

sudo CONTAINER_NAME=$CONTAINER_NAME PORT=$PORT docker compose up -d --build
