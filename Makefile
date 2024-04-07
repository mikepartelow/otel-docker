jaeger:
	docker run --rm --name jaeger \
		-p "6831:6831/udp" \
		-p "16686:16686" \
		jaegertracing/all-in-one

bootstrap:
	docker buildx create --use \
  		--name jaegerbuilder \
  		--driver docker-container \
  		--driver-opt "network=host" \
  		--driver-opt "env.JAEGER_TRACE=localhost:6831"
	docker buildx inspect --bootstrap

build:
	docker buildx build -o type=docker -f Dockerfile -t otel-docker .

traces:
	open http://127.0.0.1:16686/
