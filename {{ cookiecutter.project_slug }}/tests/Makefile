DIAG=diag.log

all: cleanup btest-verbose

# Showing all tests.
btest-verbose:
	@btest -j -f $(DIAG)

brief: cleanup btest-brief

# Brief output showing only failed tests.
btest-brief:
	@btest -j -b -f $(DIAG)

cleanup:
	@rm -f $(DIAG)
	@find ../../ -name "*.gcda" -exec rm {} \;

distclean: cleanup
	@rm -rf .btest.failed.dat \
		diag.log \
		.tmp/

.PHONY: all btest-verbose brief btest-brief cleanup

