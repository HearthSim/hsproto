SHELL := /bin/sh
PROTOC := protoc
BASE_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
PROTO_DIR := $(BASE_DIR)/proto
PROTO_FLAT_DIR := $(BASE_DIR)/proto-flat
GO_OUT := $(BASE_DIR)/go


all: go

go_clean:
	test -d "$(GO_OUT)" && rm -rf "$(GO_OUT)" || exit 0

go: go_clean
	mkdir -p "$(GO_OUT)"
	find "$(PROTO_FLAT_DIR)" -type f -name '*.proto' -exec $(PROTOC) --proto_path="$(PROTO_FLAT_DIR)" --go_out="$(GO_OUT)" {} \;

clean: go_clean
