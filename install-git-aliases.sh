#!/bin/bash
# Installs git aliases pointing to scripts in this repo
# Run once after cloning

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing git aliases..."

git config --global alias.start-worktree "!bash $SCRIPT_DIR/scripts/git-start-worktree.sh"
git config --global alias.finish-worktree "!bash $SCRIPT_DIR/scripts/git-finish-worktree.sh"

echo ""
echo "Git aliases installed!"
echo ""
echo "Available commands:"
echo "  git start-worktree <branch-name>  - Create a worktree for a task"
echo "  git finish-worktree               - Merge and cleanup (run from worktree)"
echo ""
echo "To uninstall:"
echo "  git config --global --unset alias.start-worktree"
echo "  git config --global --unset alias.finish-worktree"
