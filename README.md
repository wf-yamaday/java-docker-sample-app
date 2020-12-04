# Sample App

This app is a sample application for a multi-stage build of Docker.

- Java 1.8
- Gradle 6.2.2

## How to run

```sh
docker image build -t sample-app:latest .
docker container run -p 8080:8080 sample-app:latest
```
