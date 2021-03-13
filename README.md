# signal-cli

Make the latest version of signal-cli available in a container

The CI/CD workflows automatically test, build and push new images (amd64, arm64) to the Docker Hub container registry. Unfortunately, the arm is not available on the base image openjdk:11-jre-slim-buster so cannot be proposed

More information on signal-cli here: <https://github.com/AsamK/signal-cli>
