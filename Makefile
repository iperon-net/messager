BINARY_NAME=iperon

.PHONY: help
help:
	@echo ""
	@echo ""

.PHONY: build
build:
	dart run build_runner build --delete-conflicting-outputs


.PHONY: watch
watch:
	dart run build_runner watch
