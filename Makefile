PLATFORM="linux/amd64,linux/arm/v7"
VER=latest

all: buildx

push:
	docker buildx push lazywalker/easymosdnsd:${VER}

buildx:
	docker buildx build --platform ${PLATFORM} -t lazywalker/easymosdnsd:${VER} --push .

local:
	docker buildx build --platform linux/arm/v7 --output=type=docker -t easymosdnsd .
	docker save easymosdnsd > easymosdnsd.tar