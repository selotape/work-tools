#!/bin/bash
# Installs git worktree helper commands as global git aliases
# Works on Windows (Git Bash), macOS, and Linux
# Run once after cloning

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS_PATH="$SCRIPT_DIR/scripts"

echo "Installing git worktree helpers as global aliases..."

# Use git config --global to add aliases (cross-platform)
git config --global alias.start-worktree "!bash $SCRIPTS_PATH/git-start-worktree"
git config --global alias.finish-worktree "!bash $SCRIPTS_PATH/git-finish-worktree"

echo ""
echo "Installed! Git commands now available:"
echo "  git start-worktree <branch-name>  - Create a worktree for a task"
echo "  git finish-worktree               - Merge and cleanup (run from worktree)"
echo ""
echo "To uninstall:"
echo "  git config --global --unset alias.start-worktree"
echo "  git config --global --unset alias.finish-worktree"
