# Work Tools

Portable scripts and tools for development workflows. Designed to work across all projects.

## Installation

1. Clone this repo:
   ```bash
   git clone https://github.com/selotape/work-tools.git ~/work-tools
   ```

2. Add scripts to PATH (run once):
   ```bash
   ./install-git-aliases.sh
   source ~/.bashrc  # or restart terminal
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

## How It Works

Git automatically finds executables named `git-*` in your PATH and exposes them as subcommands. The install script adds `work-tools/scripts` to your PATH, making all `git-*` scripts available as git commands.

## Contributing

When adding new scripts:
1. Add the script to `scripts/` named `git-<command>` (no extension needed)
2. Make it executable: `chmod +x scripts/git-<command>`
3. Document in this README
