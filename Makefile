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
	echo "Patching index file..."
	mv _build/index.html _build/_index.html
	sed -e "s/data:image\/svg;base64/data:image\/svg\+xml;base64/" _build/_index.html > _build/index.html
	echo "Website built."
.PHONY: build

## Start development server
start:
	npm start
.PHONY: start

