.PHONY: test

deps:
	pip install -r requirements.txt
	pip install -r test_requirements.txt

test_smoke:
	@printf "1:" && curl http://127.0.0.1:4567/hello;
	@printf "\n2:" && curl http://127.0.0.1:4567/greetings?name=W;

test:
	gradle test
	PYTHONPATH=. py.test --verbose -s
	
test_cov:
	PYTHONPATH=. py.test --verbose -s --c0v=.
	
test_xunit:
	PYTHONPATH=. py.test -s --cov=. --cov-report xml --junit-xml=test_results.xml

run:
	gradle run

package:
	gradle package

lint:
	gradle checkstyleMain && \
	gradle checkstyleTest && \
	gradle pmdMain && \
	gradle findbugsMain
	flake8 hello_world test
	
	
