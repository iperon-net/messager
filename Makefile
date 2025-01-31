.PHONY: help
help:
	@echo ""
	@echo ""

.PHONY: gen
gen:
	dart run build_runner build --delete-conflicting-outputs

.PHONY: watch
watch:
	dart run build_runner watch
