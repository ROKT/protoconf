#!/bin/bash

# Get build + test dependencies. -d also doesn't bother with installing the
# packages, it just downloads them
go mod download
export GOROOT=$(go env GOROOT); go test -race -coverprofile=coverage.txt -covermode=atomic -v ./...