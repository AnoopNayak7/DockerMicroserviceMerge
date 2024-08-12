#!/bin/bash

# Function to build individual service images
build_service_images() {
    echo "Building image for individual services..."
    docker build -f docker/images/Dockerfile.service -t docker-all .
}

# Function to build grouped services (club) image
build_club_image() {
    echo "Building image for grouped services (club)..."
    docker build -f Dockerfile.club -t your-club-image .
}

# Function to build all services combined image
build_all_image() {
    echo "Building image for all services combined..."
    docker build -f docker/images/Dockerfile.all -t docker-all .
}

# Main script logic
case "$1" in
1)
    build_service_images
    ;;
2)
    build_club_image
    ;;
3)
    build_all_image
    ;;
*)
    echo "Usage: $0 {1|2|3}"
    echo "1 - Build individual service images"
    echo "2 - Build grouped services (club) image"
    echo "3 - Build all services combined image"
    exit 1
    ;;
esac
