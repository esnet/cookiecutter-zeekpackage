DIRS=$(subst ../scripts/,,$(wildcard ../scripts/*/* ../scripts/*.zeek ../scripts/*.bif))

all:
	cd ../scripts; zeek -b -X ../docs/zeekygen.cfg $(DIRS)
	./generate_docs.sh
	sphinx-build . html
