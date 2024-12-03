#!/usr/bin/env bash

CFLAGS="${CFLAGS} -DISO_DATE=${ISO_DATE} -DBUILD_ID=${BUILD_ID}"
export CFLAGS

echo make -j "$(nproc)" install ARCH=x86_64 CC=gcc USE_SDL=0 USE_RENDERER_DLOPEN=0 RENDERER_DEFAULT=vulkan CNAME=quake3e-vulkan BUILD_SERVER=0
make -j "$(nproc)" install ARCH=x86_64 CC=gcc USE_SDL=0 USE_RENDERER_DLOPEN=0 RENDERER_DEFAULT=vulkan CNAME=quake3e-vulkan BUILD_SERVER=0
