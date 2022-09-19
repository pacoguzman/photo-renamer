#!/bin/sh

BUILD_DIR=bin

rm -rf ${BUILD_DIR}

go build -o ./${BUILD_DIR}/renamer main.go
