# Global preferences

Read on every Claude Code session.

## Communication
- Terse over thorough. One sentence usually suffices.
- No emojis in output or code unless I explicitly ask.
- Skip trailing summaries when the diff or test result already shows the work.
- Exploratory questions ("what should we do about X?") get a recommendation + main tradeoff in 2-3 sentences, not a multi-section plan.

## Git
- HTTPS over SSH for remotes.
- Sentence-case commit subjects ("Update X", not "feat: update X").
- Only commit when I ask; never push without confirmation.
- Use HEREDOC for multi-line commit messages.

## Personal repos
- Single-author repos: work on master, no branches/PR dance unless asked.
- Don't auto-commit mid-task — show the diff, commit on my call.

## Code
- Comment only when WHY is non-obvious; never restate what the code does.
- Don't add error handling for cases that can't happen.
- Don't add backwards-compatibility shims or "removed" comments for deleted code.
