#!/bin/bash
# Usage: git start-worktree <branch-name>
# Creates a worktree in sibling directory and switches to it
#
# Example:
#   git start-worktree task-17-pdf-processing
#   cd ../$(basename $(pwd))-task-17-pdf-processing

set -e

BRANCH_NAME=$1
if [ -z "$BRANCH_NAME" ]; then
    echo "Usage: git start-worktree <branch-name>"
    echo "Example: git start-worktree task-17-pdf-processing"
    exit 1
fi

# Get repo name and parent directory
REPO_NAME=$(basename $(pwd))
PARENT_DIR=$(dirname $(pwd))
WORKTREE_DIR="$PARENT_DIR/$REPO_NAME-$BRANCH_NAME"

# Pull latest and create worktree
git pull
git worktree add "$WORKTREE_DIR" -b "$BRANCH_NAME"

echo ""
echo "Worktree created!"
echo "Run: cd $WORKTREE_DIR"
echo ""
echo "When done, run: git finish-worktree"
