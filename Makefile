PLATFORM="linux/amd64,linux/arm/v7"
VER=latest

all: buildx

push:
	docker buildx push lazywalker/mosdnsx:${VER}

buildx:
	docker buildx build --platform ${PLATFORM} -t lazywalker/mosdnsx:${VER} --push .

local:
	docker buildx build --platform linux/arm/v7 --output=type=docker -t mosdnsx .
	docker save mosdnsx > mosdnsx.tar