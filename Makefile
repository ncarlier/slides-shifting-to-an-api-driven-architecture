.SILENT :

all: build

## Build static website
build:
	npm install
	npm run dist
	mkdir -p _build/assets _build/img
	cp -R css fonts _build/assets/
	cp img/*.* _build/img
.PHONY: build

## Start development server
start:
	npm start
.PHONY: build

