#!/usr/bin/env bash
set -e

echo "🍺 Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "➡️ Initializing brew shell environment..."
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [ -f /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

echo "📦 Installing Texture baseline apps..."
brew bundle install --file=./Brewfile

echo "🎉 Done! Texture macOS baseline installed."
