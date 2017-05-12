test_smoke:
	@curl http://127.0.0.1:4567/hello;
	curl http://127.0.0.1:4567/greetings?name=W;

test:
	gradle test

lint:
	gradle checkstyleMain && \
	gradle checkstyleTest && \
	gradle pmdMain
