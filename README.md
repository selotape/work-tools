# Work Tools

Portable scripts and tools for development workflows. Designed to work across all projects.

## Installation

1. Clone this repo:
   ```bash
   git clone https://github.com/selotape/work-tools.git ~/work-tools
   ```

2. Add git aliases (run once):
   ```bash
   ./install-git-aliases.sh
   ```

## Available Tools

### Git Worktree Helpers

Simplify multi-agent workflows with git worktrees:

```bash
# Start a new worktree for a task
git start-worktree task-17-feature-name

# When done, merge and cleanup (run from inside worktree)
git finish-worktree
```

**What they do:**
- `start-worktree`: Creates worktree + branch, pulls latest main
- `finish-worktree`: Commits, pushes, merges to main, cleans up worktree and branch

### Usage Notes

- These scripts assume your main repo is at a predictable location
- Edit the scripts if your directory structure differs
- Scripts are designed for multi-agent workflows (multiple Claude agents working simultaneously)

## Contributing

When adding new scripts:
1. Add the script to `scripts/`
2. Update `install-git-aliases.sh` if it should be a git alias
3. Document in this README
