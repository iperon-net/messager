.PHONY: help
help:
	@echo ""
	@echo ""

.PHONY: gen
gen:
	protoc --dart_out=grpc:lib/protobuf -I=. protos/* google/protobuf/timestamp.proto
	dart run build_runner build --delete-conflicting-outputs

.PHONY: watch
watch:
	dart run build_runner watch
