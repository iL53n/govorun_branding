#!/usr/bin/env bash
set -euo pipefail
UPSTREAM="$1"

# Copy branding assets into the upstream repo
mkdir -p "$UPSTREAM/public"
cp -f branding/manifest.json            "$UPSTREAM/public/manifest.json" || true
cp -f branding/favicon.ico              "$UPSTREAM/public/favicon.ico" || true
cp -f branding/logo.svg                 "$UPSTREAM/public/logo.svg" || true
cp -f branding/apple-touch-icon.png     "$UPSTREAM/public/apple-touch-icon.png" || true
cp -f branding/og.jpg                   "$UPSTREAM/public/og.jpg" || true

# Optional: replace Next.js metadata file if you added one
if [ -f patches/layout.tsx ]; then
  if [ -f "$UPSTREAM/src/app/layout.tsx" ]; then
    cp -f patches/layout.tsx "$UPSTREAM/src/app/layout.tsx"
  elif [ -f "$UPSTREAM/app/layout.tsx" ]; then
    cp -f patches/layout.tsx "$UPSTREAM/app/layout.tsx"
  fi
fi
