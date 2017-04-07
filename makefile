all: build/crystal-boy-release

O := build
SOURCES := $(shell find lib -name '*.cr')
SPEC_SOURCES := $(shell find spec -name '*.cr')
SHELL = bash

build/crystal-boy-release: $(SOURCES)
	crystal build -o $(O)/crystal-boy-release lib/crystal-boy.cr --release

build/crystal-boy-debug: $(SOURCES)
	crystal build -o $(O)/crystal-boy-debug lib/crystal-boy.cr --debug

build: $(O)/crystal-boy-release

spec:
	crystal spec

clean:
	rm -f $(O)/crystal-boy-debug $(O)/crystal-boy-release

run: build/crystal-boy-debug
	$(O)/crystal-boy-debug

.PHONY: build run spec clean
