# dotfiles

Chezmoi-managed dotfiles for macOS. Source state lives here; chezmoi applies
into `$HOME`.

## Naming conventions

| Prefix in repo | Deploys to |
|---|---|
| `dot_foo`        | `~/.foo` |
| `private_foo`    | `~/foo` with mode 0600 |
| `executable_foo` | `~/foo` with +x |
| `empty_dot_foo`  | `~/.foo` (empty, force-created) |

Examples: `dot_zshrc` → `~/.zshrc`, `dot_claude/` → `~/.claude/`,
`dot_config/nvim/` → `~/.config/nvim/`.

## Layout

- `dot_claude/` — Claude Code global config (`CLAUDE.md`, `settings.json`,
  later: `commands/`, `agents/`)
- `dot_config/` — XDG config: `nvim/`, `ghostty/`
- `dot_vim/spell/` — vim spell file (the rest of the old vim config is gone;
  nvim is primary)
- `dot_bin/` — personal scripts on PATH
- `private_Library/` — macOS `~/Library/Application Support` configs
- `.chezmoiignore` — files in this repo that don't deploy, plus guards
  against `chezmoi re-add` for transient state

## Workflow

- Edit source files in this repo, never `~/.foo` directly.
- `chezmoi diff` to preview, `chezmoi apply` to deploy.
- Auto-commit and auto-push are off — commit explicitly.

## Companion repo

[`cknadler/setup`](https://github.com/cknadler/setup) — bootstrap a fresh
macOS machine (Brewfiles, `.osx`, runs `chezmoi init` for this repo).
