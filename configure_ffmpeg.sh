#!/bin/bash
pushd `dirname $0`
. settings.sh

pushd ffmpeg

./configure \
--arch=arm \
--cpu=cortex-a8 \
--target-os=linux \
--enable-cross-compile \
--cross-prefix=$NDK_TOOLCHAIN_BASE/bin/$NDK_ABI-linux-androideabi- \
--sysroot="$NDK_SYSROOT" \
--extra-cflags="-I../x264 -mfloat-abi=softfp -mfpu=neon -fPIE -pie" \
--extra-ldflags="-L../x264 -fPIE -pie" \
--pkg-config="../fake-pkg-config" \
--prefix=$prefix \
--enable-pic \
\
--disable-shared \
--enable-static \
--enable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
\
--enable-small \
\
--enable-version3 \
--enable-gpl \
\
--disable-doc \
--disable-debug \
\
--enable-decoders \
--enable-encoders \
--enable-muxers \
--enable-demuxers \
--enable-parsers \
--enable-protocols \
--enable-filters \
--enable-avresample \
\
--disable-indevs \
--enable-indev=lavfi \
--disable-outdevs \
\
--enable-hwaccels \
\
--enable-libx264 \
--enable-zlib \
--enable-muxer=md5

popd; popd
