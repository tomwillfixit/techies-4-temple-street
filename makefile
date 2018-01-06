label?=t4ts

build:
	docker build -t techies-4-temple-street:latest .

start:
	docker run -d \
	--name techies \
	--cpus="1" \
	--cpuset-cpus="0" \
	--restart="always" \
	-e worker_label=$(label) \
	techies-4-temple-street:latest

cleanup:
	docker rm -f techies

logs:
	docker logs -f techies
