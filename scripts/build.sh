#!/bin/sh
set -eu

# Hugo does not remove stale files from the output directory by default.
# Clean `public/` first so drafts and deleted pages do not stay live.
rm -rf public
hugo --gc --minify
