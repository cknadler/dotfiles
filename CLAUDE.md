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
- `dot_vimrc` — the single, plugin-free Vim config. Sourced by terminal `vim`,
  `gvim`, and MacVim (`mvim`) — gvim/MacVim load `~/.vimrc` first, so there is
  no `~/.gvimrc` and no duplication. GUI settings apply via a `GUIEnter`
  autocmd. nvim (`dot_config/nvim/`) is still the primary editor.
- `dot_vim/spell/` — shared personal spell dictionary (`en.utf-8.add`). Both
  Neovim (`dot_config/nvim/lua/options.lua` sets `spellfile`) and `dot_vimrc`
  point here, so `zg`-added words are shared across all editors.
- `dot_vim/colors/molokai.vim` — molokai for Vim/MacVim (`dot_vimrc` loads it);
  nvim has its own molokai via lazy.nvim.
- `dot_bin/` — personal scripts on PATH
- `private_Library/` — macOS `~/Library/Application Support` configs
- `.chezmoiignore` — files in this repo that don't deploy, plus guards
  against `chezmoi re-add` for transient state

## Workflow

- Edit source files in this repo, never `~/.foo` directly.
- `chezmoi diff` to preview, `chezmoi apply` to deploy.
- Auto-commit and auto-push are off — commit explicitly.

## Commit messages

- Describe what changed and why, in plain terms. Sentence-case subject.
- No `Stage N:` prefixes and no references to the plan or its staging.
- Don't narrate how the work was done (process, review steps, test counts as
  the point of the commit) — describe the change itself.

## Companion repo

[`cknadler/setup`](https://github.com/cknadler/setup) — bootstrap a fresh
macOS machine (Brewfiles, `.osx`, runs `chezmoi init` for this repo).
