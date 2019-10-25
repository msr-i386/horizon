#!/bin/sh

base="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+\/"
horizon="-_­¯ˉ˗̵̶̠̱̲̄̅͟͞ߺᅳ᎗ᐨ ᠆᠊‐‑‒–—―‾⁃౼⁻₋−⎺⎻⎼⎽⏤─━╴╶╸╺▔⚊Ⲻⲻ⸏⸻⼀ーㅡ㆒㇐ꣻ﹘ﹶﹺ－ｰￚ￣"

encode_horizon() {
  echo ${@} | \
  base64 | \
  sed "y/${base}/${horizon}/"
}

decode_horizon() {
  echo ${@} | \
  sed "y/${horizon}/${base}/" | \
  base64 -d
}

if [ "${1}" = "-d" ]; then
  shift
  if [ "${#}" -eq 0 ]; then
    while read line ; do
      decode_horizon ${line}
    done
    exit 0
  fi
  else
    decode_horizon ${@}
    exit 0
fi

if [ "${#}" -eq 0 ]; then
  while read line ; do
    encode_horizon ${line}
  done
  exit 0
elif [ "${1}" = "--help" ]; then
  echo "usage: encode [-d] [string ...]"
  exit 0
else
  encode_horizon ${@}
  exit 0
fi