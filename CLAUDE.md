# CLAUDE.md

Instructions for Claude agents working on work-tools.

## Project Overview

This is a collection of portable development scripts and tools. Keep scripts:
- Simple and focused (one job per script)
- Well-documented (comments + README)
- Cross-platform where possible (bash works on Windows Git Bash, macOS, Linux)

## Adding New Scripts

1. Create script in `scripts/` directory
2. Make it executable: `chmod +x scripts/my-script.sh`
3. If it should be a git alias, add to `install-git-aliases.sh`
4. Document usage in README.md

## Code Style

- Use bash for shell scripts
- Add usage examples in comments at top of script
- Fail fast with helpful error messages
- Don't silently modify things - be explicit
