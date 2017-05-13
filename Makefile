test_smoke:
	@printf "1:" && curl http://127.0.0.1:4567/hello;
	@printf "\n2:" && curl http://127.0.0.1:4567/greetings?name=W;

test:
	gradle test

lint:
	gradle checkstyleMain && \
	gradle checkstyleTest && \
	gradle pmdMain
