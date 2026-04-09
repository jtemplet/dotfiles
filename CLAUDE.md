# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Personal dotfiles repository for macOS. Config files are stored **without** the leading dot (e.g., `bashrc` not `.bashrc`) and are intended to be symlinked into `$HOME`. There is no install script or automated symlink manager — files are deployed manually.

## Repository Layout

- **Shell:** `bash_profile` (login shell setup, PATH, environment), `bashrc` (interactive shell, prompt, functions), `bash_aliases` (aliases for git, Django, macOS utilities)
- **Git:** `gitconfig` (aliases, diff/merge tool config using Meld), `gitignore` (global ignore patterns), `gitmodules`
- **Vim:** `vimrc` (vim-plug with PaperColor dark theme, 2-space soft tabs), `gvimrc`
- **Browser routing:** `.finicky.js` (Finicky app — routes URLs to Safari/Firefox/Chrome/native apps)
- **Other:** `inputrc`, `screenrc`, `dircolors`, `pylintrc`, `ackrc`
- **Data:** `dat/` contains iTerm2/Terminal.app color schemes
- **IPython:** `.ipython/` contains legacy IPython configs

## Key Conventions

- Files target both macOS (`jtempleton` user) and legacy Linux (`jtemplet` user) — conditionals in `bash_aliases` and `bash_profile` switch on `$LOGNAME`.
- Git aliases are defined in two places: `gitconfig` `[alias]` section and shell aliases in `bash_aliases`. The shell aliases are shorter (e.g., `gs` = `git status`) while gitconfig aliases are used as `git <alias>` (e.g., `git lol`).
- The global `gitignore` is referenced by `gitconfig` via `core.excludesfile` pointing to `/Users/jtempleton/.gitignore`.

## Security Note

`gitconfig` contains a hardcoded GitHub token on line 6. This should be moved to a credential helper or environment variable.
