PL = swipl
SRC_DIR = src
TEST_DIR = tests

test:
	$(PL) --on-error=halt --on-warning=halt -t 'run_tests, halt' -f $(SRC_DIR)/interactive.pl

repl:
	$(PL) -s $(SRC_DIR)/interactive.pl

run:
	@$(PL) -s $(SRC_DIR)/start.pl

build:
	@echo "Building project"
	$(PL) --on-error=halt --on-warning=halt --quiet -t 'main, halt' -f $(SRC_DIR)/save.pl

clean:
	@rm bin/*

.PHONY: test repl build
