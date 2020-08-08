DIRS=$(subst ../scripts/,,$(wildcard ../scripts/*))

all:
	cd ../scripts; zeek -b -X ../docs/zeekygen.cfg $(DIRS)
