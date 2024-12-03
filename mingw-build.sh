#!/usr/bin/env bash
export MYFLAGS="${CFLAGS} -D_DELETE_ME=1"
echo "MYFLAGS=${MYFLAGS}"

CFLAGS="-DISO_DATE=${ISO_DATE} -DBUILD_ID=${BUILD_ID}"
export CFLAGS

echo '### env ####'
env | sort
echo "Build.BuildId=${BUILD_ID}"
echo "Build.SourcesDirectory=${SOURCES_DIR}"
cd "$SOURCES_DIR" || exit 1
echo make -j "$(nproc)" install ARCH=x86_64 CC=gcc USE_SDL=0 USE_RENDERER_DLOPEN=0 RENDERER_DEFAULT=vulkan CNAME=quake3e-vulkan BUILD_SERVER=0

