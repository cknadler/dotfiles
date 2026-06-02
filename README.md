# cknadler dotfiles

[chezmoi](https://www.chezmoi.io)-managed dotfiles for macOS.

Bootstrap is handled by [`cknadler/setup`](https://github.com/cknadler/setup) —
its `chezmoi` step initializes from this repo. To apply changes after editing:

```bash
chezmoi diff    # preview
chezmoi apply   # deploy to $HOME
```

See [`CLAUDE.md`](./CLAUDE.md) for the repo layout and naming conventions.
