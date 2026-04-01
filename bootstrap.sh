#!/usr/bin/env bash
set -e

PROFILE=""
BASE_URL="https://raw.githubusercontent.com/TextureHQ/laptop-setup/main"

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile)
      PROFILE="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: bootstrap.sh [--profile eng|business]"
      exit 1
      ;;
  esac
done

# Validate profile if provided
if [[ -n "$PROFILE" && "$PROFILE" != "eng" && "$PROFILE" != "business" ]]; then
  echo "❌ Unknown profile: $PROFILE"
  echo "Valid profiles: eng, business"
  exit 1
fi

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "➡️ Initializing brew shell environment..."
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [ -f /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Always install core
echo "📥 Fetching core Brewfile..."
curl -fsSL "${BASE_URL}/Brewfile.core" -o /tmp/Brewfile.core

echo "📦 Installing Texture core apps..."
brew bundle install --file=/tmp/Brewfile.core

# Install profile-specific Brewfile if requested
if [[ -n "$PROFILE" ]]; then
  echo "📥 Fetching ${PROFILE} Brewfile..."
  curl -fsSL "${BASE_URL}/Brewfile.${PROFILE}" -o "/tmp/Brewfile.${PROFILE}"

  echo "📦 Installing ${PROFILE} profile apps..."
  brew bundle install --file="/tmp/Brewfile.${PROFILE}"
fi

echo "🎉 Done! Texture macOS baseline installed."
if [[ -n "$PROFILE" ]]; then
  echo "   Profile: ${PROFILE}"
else
  echo "   Profile: core (default)"
fi
