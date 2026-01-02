#!/bin/bash
# Usage: git finish-worktree
# Run from inside a worktree. Commits, pushes, merges to main, cleans up.
#
# Example:
#   cd my-repo-task-17-feature
#   git finish-worktree

set -e

# Get current branch name
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
    echo "Error: You're on $BRANCH. Run this from inside a worktree."
    exit 1
fi

# Detect main repo location (worktree is sibling with branch name suffix)
WORKTREE_DIR=$(pwd)
WORKTREE_NAME=$(basename "$WORKTREE_DIR")
# Remove branch suffix to get main repo name
MAIN_REPO_NAME=$(echo "$WORKTREE_NAME" | sed "s/-$BRANCH//")
PARENT_DIR=$(dirname "$WORKTREE_DIR")
MAIN_REPO="$PARENT_DIR/$MAIN_REPO_NAME"

if [ ! -d "$MAIN_REPO/.git" ]; then
    echo "Error: Could not find main repo at $MAIN_REPO"
    echo "   Expected worktree naming: {repo-name}-{branch-name}"
    exit 1
fi

echo "Finishing branch: $BRANCH"
echo "Main repo: $MAIN_REPO"

# Commit any remaining changes
if [ -n "$(git status --porcelain)" ]; then
    echo "Committing remaining changes..."
    git add -A
    git commit -m "Complete $BRANCH"
fi

# Push branch
echo "Pushing branch..."
git push -u origin "$BRANCH"

# Switch to main repo and merge
echo "Merging to main..."
cd "$MAIN_REPO"

# Check if main repo has uncommitted changes (from another agent)
if [ -n "$(git status --porcelain)" ]; then
    echo ""
    echo "WARNING: Main repo has uncommitted changes (probably from another agent)."
    echo "   These files have changes:"
    git status --short
    echo ""
    echo "   Options:"
    echo "   1. Wait for the other agent to commit, then retry"
    echo "   2. Manually commit their changes if they're abandoned"
    echo "   3. Run: git checkout -- . (DANGER: discards their work)"
    echo ""
    exit 1
fi

git pull
git merge "$BRANCH" -m "Merge $BRANCH"
git push

# Clean up
echo "Cleaning up worktree..."
git worktree remove "$WORKTREE_DIR"
git branch -d "$BRANCH"

echo ""
echo "Done! Branch $BRANCH merged and cleaned up."
