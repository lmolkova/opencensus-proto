#!/usr/bin/env bash

# Run this if opencensus-proto is checked in the GOPATH.
# go get -d github.com/census-instrumentation/opencensus-proto
# to check in the repo to the GOAPTH.
#
# To generate:
#
# cd $(go env GOPATH)/census-instrumentation/opencensus-proto
# ./mkgogen.sh

OUTDIR="$(go env GOPATH)/src"

protoc --go_out=plugins=grpc:$OUTDIR opencensus/proto/stats/v1/stats.proto \
    && protoc --go_out=plugins=grpc:$OUTDIR opencensus/proto/metrics/v1/metrics.proto \
    && protoc --go_out=plugins=grpc:$OUTDIR opencensus/proto/trace/v1/trace.proto \
    && protoc --go_out=plugins=grpc:$OUTDIR opencensus/proto/trace/v1/trace_config.proto \
    && protoc -I=. --go_out=plugins=grpc:$OUTDIR opencensus/proto/agent/common/v1/common.proto \
    && protoc -I=. --go_out=plugins=grpc:$OUTDIR opencensus/proto/agent/trace/v1/trace_service.proto
