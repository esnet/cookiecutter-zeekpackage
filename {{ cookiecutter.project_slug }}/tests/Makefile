DIAG=diag.log

all: cleanup btest-verbose coverage

# Showing all tests.
btest-verbose:
	@btest -j -f $(DIAG) || cat $(DIAG)

brief: cleanup btest-brief

# Brief output showing only failed tests.
btest-brief:
	@btest -j -b -f $(DIAG) || cat $(DIAG)

coverage:
	@./Scripts/coverage

cleanup:
	@rm -f $(DIAG)
	@rm -f .tmp/script-coverage/*
	@find ../../ -name "*.gcov" -exec rm {} \;

distclean: cleanup
	@rm -rf .btest.failed.dat \
		diag.log \
		.tmp/

.PHONY: all btest-verbose brief btest-brief cleanup

