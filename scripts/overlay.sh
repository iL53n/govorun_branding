#!/usr/bin/env bash
set -euo pipefail

# $1 = path to upstream lobe-chat repo (checked out by workflow)
UPSTREAM="$1"

# copy assets
mkdir -p "$UPSTREAM/public"
cp -f branding/favicon.ico              "$UPSTREAM/public/favicon.ico"
cp -f branding/logo.svg                 "$UPSTREAM/public/logo.svg"
cp -f branding/apple-touch-icon.png     "$UPSTREAM/public/apple-touch-icon.png"
cp -f branding/og.jpg                   "$UPSTREAM/public/og.jpg"
cp -f branding/manifest.json            "$UPSTREAM/public/manifest.json"

# optional: replace layout metadata (path may vary slightly upstream)
if [ -f patches/layout.tsx ]; then
  # Try common locations; adjust if repo layout changes
  if [ -f "$UPSTREAM/src/app/layout.tsx" ]; then
    cp -f patches/layout.tsx "$UPSTREAM/src/app/layout.tsx"
  elif [ -f "$UPSTREAM/app/layout.tsx" ]; then
    cp -f patches/layout.tsx "$UPSTREAM/app/layout.tsx"
  fi
fi
