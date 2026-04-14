#!/usr/bin/env bash
# Install Claude Code by fetching and running the official installer
# from claude.ai.
#
# Usage:
#   ./install.sh
#   curl -fsSL https://raw.githubusercontent.com/<owner>/<repo>/main/install.sh | bash

set -euo pipefail

INSTALLER_URL="${CLAUDE_INSTALLER_URL:-https://claude.ai/install.sh}"

if command -v curl >/dev/null 2>&1; then
    fetch() { curl -fsSL "$1"; }
elif command -v wget >/dev/null 2>&1; then
    fetch() { wget -qO- "$1"; }
else
    echo "error: neither curl nor wget is installed" >&2
    exit 1
fi

echo "Fetching Claude Code installer from ${INSTALLER_URL}..."
fetch "${INSTALLER_URL}" | bash
