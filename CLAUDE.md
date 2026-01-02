# CLAUDE.md

Instructions for Claude agents working on work-tools.

## Project Overview

This is a collection of portable development scripts and tools. Keep scripts:
- Simple and focused (one job per script)
- Well-documented (comments + README)
- Cross-platform where possible (bash works on Windows Git Bash, macOS, Linux)

## Adding New Git Commands

Git automatically finds executables named `git-*` in PATH. To add a new git command:

1. Create script in `scripts/` named `git-<command>` (no extension)
2. Make it executable: `chmod +x scripts/git-<command>`
3. Document usage in README.md

Example: `scripts/git-sync` becomes available as `git sync`

## Code Style

- Use bash for shell scripts
- Add usage examples in comments at top of script
- Fail fast with helpful error messages
- Don't silently modify things - be explicit
