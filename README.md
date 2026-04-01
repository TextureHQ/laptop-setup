# Texture macOS Laptop Setup

Standard Texture baseline setup for new macOS laptops. Installs Homebrew and a curated set of CLI tools and apps via profile-based Brewfiles.

## Profiles

| Profile | What's installed | Who it's for |
|---------|-----------------|--------------|
| *(none)* | Core CLI tools + core apps | Everyone (non-engineering default) |
| `eng` | Core + dev tooling + dev apps | Engineers |
| `business` | Core + business apps | Non-engineering roles |

## Usage

### Core only (default)

```bash
bash <(curl -fsSL https://texturehq.github.io/laptop-setup/bootstrap.sh)
```

### Engineering

```bash
bash <(curl -fsSL https://texturehq.github.io/laptop-setup/bootstrap.sh) --profile eng
```

### Business

```bash
bash <(curl -fsSL https://texturehq.github.io/laptop-setup/bootstrap.sh) --profile business
```

## What's in each profile?

### Core (`Brewfile.core`)

**CLI tools:** git, gh, bash, jq, fzf, tree, watch, httpie, tldr, wget

**Apps:** 1Password, 1Password CLI, Slack, Tailscale, Google Chrome, Notion, Claude, ChatGPT, Figma

### Engineering (`Brewfile.eng`)

**CLI tools:** node, yarn, go, uv

**Apps:** Cursor, VS Code, Docker, Zed, Bruno, ngrok, iTerm2, JetBrains Mono font

### Business (`Brewfile.business`)

**Apps:** Zoom

## Manual install

If you prefer to run `brew bundle` directly, the default `Brewfile` in this repo contains core + engineering tools:

```bash
brew bundle install --file=Brewfile
```
