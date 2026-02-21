#!/bin/bash

set -e  # exit on error

# Get the absolute path of the project directory
PROJECT_DIR=$(realpath "$(dirname "$(pwd)")")
DOCKER_IMAGE="alextongdo/openrlhf:v0.0.1"

# -v ~/.cache/huggingface:/root/.cache/huggingface passes the HF auth token if you are logged in outside the container.
# -e NCCL_P2P_LEVEL=NVL \
docker run \
    --gpus all \
    --name openrlhf \
    --rm \
    --shm-size=10g \
    --ipc=host \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    -v "${PROJECT_DIR}/:/workspace" \
    -v "$HOME/.cache/huggingface:/root/.cache/huggingface" \
    -w /workspace \
    -it "${DOCKER_IMAGE}" /bin/bash