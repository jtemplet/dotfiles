# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Personal dotfiles repository for macOS. Config files are stored **without** the leading dot (e.g., `gitconfig` not `.gitconfig`) and are intended to be symlinked into `$HOME`. There is no install script or automated symlink manager — files are deployed manually.

## Repository Layout

- **Git:** `gitconfig` (aliases, diff/merge tool config using Meld), `gitignore` (global ignore patterns)
- **Vim:** `vimrc` (vim-plug with PaperColor dark theme, 2-space soft tabs)
- **Browser routing:** `.finicky.js` (Finicky app — routes URLs to Safari/Firefox/Chrome/native apps). API docs: https://github.com/johnste/finicky/wiki/Configuration-(v4)

## Key Conventions

- Git aliases are defined in `gitconfig` `[alias]` section (e.g., `git lol`, `git pf`).
- The global `gitignore` is referenced by `gitconfig` via `core.excludesfile` pointing to `/Users/jtempleton/.gitignore`.
- `.finicky.js` uses the leading dot (it's the one exception — Finicky requires it at `~/.finicky.js`).
