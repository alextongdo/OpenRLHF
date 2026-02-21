```
cd docker
docker build -t alextongdo/openrlhf:v0.0.1 -f Dockerfile.dev .
bash ./launch_docker.sh
```

Once you're in the Docker container.
```
cd docker
bash ./extra_setup_in_docker.sh
cd ..
```