#!/usr/bin/env bash
export MYFLAGS="${CFLAGS} -D_DELETE_ME=1"
echo "MYFLAGS=${MYFLAGS}"

CFLAGS="-DISO_DATE=${ISO_DATE} -DBUILD_ID=$(Build.BuildId)"
export CFLAGS

echo '### env ####'
env | sort
echo "Build.BuildId=${Build.BuildId}"
echo "Build.SourcesDirectory=${Build.SourcesDirectory}"
cd '$(Build.SourcesDirectory)' || exit 
echo make -j "$(nproc)" install ARCH=x86_64 CC=gcc USE_SDL=0 USE_RENDERER_DLOPEN=0 RENDERER_DEFAULT=vulkan CNAME=quake3e-vulkan BUILD_SERVER=0

