# Docker image of easymosdns setup (with mosdns-x)

## Multi-platform builder of Docker

···
docker buildx create --name multi-platform --use --platform linux/amd64,linux/arm64,linux/arm/v7 --driver docker-container
···

## Run on port 54

```
docker run -it --rm -p 54:53/udp -p 54:53/tcp lazywalker/easymosdnsd
```
