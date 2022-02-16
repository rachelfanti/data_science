
help:
	cat Makefile
run:
	docker-compose up
exec:
	docker-compose exec atml_202021 bash
build: stop .FORCE
	docker-compose build
rebuild: stop .FORCE
	docker-compose build --force-rm
stop:
	docker stop atml_202021 || true; docker rm atml_202021 || true;
.FORCE:
