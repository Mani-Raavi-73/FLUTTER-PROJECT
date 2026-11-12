#!/usr/bin/env bash
# Exit immediately if a command exits with a non-zero status
set -e

echo "==============================================="
echo "==> Setting up Flutter SDK on Render..."
echo "==============================================="

FLUTTER_DIR="$HOME/flutter"

if [ ! -d "$FLUTTER_DIR" ]; then
  echo "==> Downloading Flutter (stable branch)..."
  git clone https://github.com/flutter/flutter.git --depth 1 -b stable "$FLUTTER_DIR"
else
  echo "==> Flutter already present at $FLUTTER_DIR"
fi

# Add Flutter binary to PATH
export PATH="$FLUTTER_DIR/bin:$PATH"

echo "==> Checking Flutter installation..."
flutter --version
flutter config --no-analytics

echo "==> Installing project dependencies..."
flutter pub get

echo "==> Building Flutter Web Release bundle..."
flutter build web --release --base-href /

echo "==============================================="
echo "==> Build successful! Artifacts in build/web"
echo "==============================================="
