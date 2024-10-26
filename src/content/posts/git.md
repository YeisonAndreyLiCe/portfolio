---
title: Git
pubDate: 2024-10-06
description: "Let's explore git"
tags: ["git"]
layout: "../../layouts/Post.astro"
snippet:
  language: "bash"
  code: "git init"
---

# Git

## A little of history

- Local version control systems: project_v1, project_v2, project_v3. Not good.
- Centralized version control systems: Single point of failure. A server with the history, many clients with snapshots of a state of the history.
- Distributed control systems: Every client has the full history.

## Thinking about streams of snapshots not deltas

Before Git, most version control systems thought about the history as a set of changes (deltas). Git thinks about the history as a stream of snapshots. When committing gits takes a picture of how your files look like, it saves a reference to that picture, if a file has not changed it saves a reference to the previous picture.

## Integrity

Git uses SHA-1 hashes to identify the snapshots. Checksumming enables git detect changes.

## Three states

- Modified: File has been changed but not committed.
- Staged: Flagged a file's changed version to be committed in the next snapshot.
- Committed: Data is stored in the local database.

## Git configuration

1. [path]/etc/gitconfig: System-wide configuration.
2. ~/.gitconfig or ~/.config/git/config: User-specific configuration. Use --global to set this configuration.
3. .git/config: Repository-specific configuration. Use --local to set this configuration.

Use the following command to see the configurations:

```bash
git config --list --show-origin
```

```bash
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global core.editor vim
git config --global init.defaultBranch main
```

see the configurations with:

```bash
git config --list
git config user.name # git config <key>
git config --show-origin rerere.autoUpdate # git config --show-origin <key>
```

## Initializing a Repository in an Existing Directory

You should be on a directory that is currently not under version control. Then run:

```bash
git init
```

## Cloning an Existing Repository

Cloning a repo store on https://repo.com, creates a directory with the name of the repo or the name you specify, initializes a .git directory inside it, pulls down all the data for that repository, and checks out a working copy of the latest version. Git can be uses with different protocols like HTTPS, SSH, and git.

```bash
git clone https://repo.com [directory] # directory is optional
```

## Common commands

```bash
git add [file/directory] # git add the content on [file/directory] to the next commit!
git commit -m "Message" # git save the changes add the message "Message"!
git status # git show the status of the files! Untracked, Changes to be committed
```

# Ignoring Files

https://github.com/github/gitignore

```bash
cat .gitignore
# ignore all .a files
*.a
# but do track lib.a, even though you're ignoring .a files above
!lib.a
# only ignore the TODO file in the current directory, not sub_dir/TODO
/TODO
# ignore all files in any directory named build
build/
# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt
# ignore all .pdf files in the doc/ directory and any of its subdirectories
doc/**/*.pdf
```

## Git aliases

```bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
```

## Conclusions

What makes git fast is having the history on local.
