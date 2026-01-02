#!/bin/bash
# Adds scripts directory to PATH so git can find git-* commands
# Run once after cloning

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS_PATH="$SCRIPT_DIR/scripts"

# Determine which shell config file to use
if [ -f "$HOME/.bashrc" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
elif [ -f "$HOME/.bash_profile" ]; then
    SHELL_CONFIG="$HOME/.bash_profile"
else
    SHELL_CONFIG="$HOME/.bashrc"
fi

# Check if already in PATH
if echo "$PATH" | grep -q "$SCRIPTS_PATH"; then
    echo "work-tools scripts already in PATH"
else
    echo "Adding work-tools/scripts to PATH..."
    echo "" >> "$SHELL_CONFIG"
    echo "# work-tools git commands" >> "$SHELL_CONFIG"
    echo "export PATH=\"\$PATH:$SCRIPTS_PATH\"" >> "$SHELL_CONFIG"
    echo ""
    echo "Added to $SHELL_CONFIG"
    echo "Run: source $SHELL_CONFIG (or restart terminal)"
fi

echo ""
echo "Git commands available (after PATH update):"
echo "  git start-worktree <branch-name>  - Create a worktree for a task"
echo "  git finish-worktree               - Merge and cleanup (run from worktree)"
echo ""
echo "To uninstall: remove the work-tools lines from $SHELL_CONFIG"
