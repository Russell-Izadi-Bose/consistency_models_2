#!/bin/bash

# Set the name and key variables
NAME="consistency_models_2"
KEY="9f968bff4a76b6f86e26a21852bb7c65861ce81f"

# Configure the safe directory in git
git config --global --add safe.directory "/home/${NAME}"
echo "Added /home/${NAME} as a safe directory in git."

# Login to wandb
wandb login "${KEY}"
echo "Logged in to wandb."
