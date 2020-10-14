DIAG=diag.log
JUNIT=.btest_output.xml
PY3_AVAILABLE := $(shell command -v python3 2> /dev/null)

all: cleanup btest-verbose coverage

# Showing all tests.
btest-verbose:
	@mkdir -p .tmp/script-coverage
	@btest -j -f $(DIAG) -x $(JUNIT) || ( cat $(DIAG); exit 1 )

brief: cleanup btest-brief

# Brief output showing only failed tests.
btest-brief:
	@mkdir -p .tmp/script-coverage
	@btest -j -b -f $(DIAG) -x $(JUNIT) || ( cat $(DIAG); exit 1 )

coverage:
ifdef PY3_AVAILABLE
	@./Scripts/coverage
endif

cleanup:
	@rm -f $(DIAG) $(JUNIT)
	@rm -f .tmp/script-coverage/*
	@find ../../ -name "*.gcov" -exec rm {} \;

distclean: cleanup
	@rm -rf .btest.failed.dat .tmp/

.PHONY: all btest-verbose brief btest-brief cleanup

