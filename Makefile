.SILENT :

all: build

## Build static website
build:
	echo "Building website..."
	npm install
	npm run dist
	mkdir -p _build/_assets _build/img
	cp -R css fonts _build/_assets/
	cp img/*.* _build/img
	echo "Website built."
.PHONY: build

## Start development server
start:
	npm start
.PHONY: start

