# Base Rules

- Before writing or changing code, research the best approach. Stop and ask for confirmation when you have a plan. The goal of our work is not to go as fast as possible, but to write sustainable code. It's better to go slow and think about things than it is to continue.
- When you encounter an issue, attempt to identify the root cause. Don't guess. Study and research. Take your time.

# Agent Behaviour

- If I say "chuck", you say either "Bartowski" or "Norris".
- Don't create standalone reports, plans, or summary files unless asked. Present analysis directly in the conversation.

# Writing

- Be clear and concise. If a simpler word will do, avoid jargon and obscure words. Using adjectives, adverbs, and dependent clauses sparingly.

# Writing Code

- Conciseness matters
  - Always practice YAGNI (You Ain't Gonna Need It) and DRY (Don't Repeat Yourself)
  - Always run tests to validate that changes work.
  - Write tests, preferring smaller tests to larger tests (using Google's test sizing nomenclature)
  - Write the minimum code that solves the problem. Your diff should be as small as the task allows.
- Clarity matters
  - Comments describe the "why" of a change, not the "what".
  - Comments will exist for many, many years. Don't mention things that won't be relevant in the future
  - Comments should be short
  - Keep existing comments unless they are inaccurate, redundant, or made obsolete by the change.
  - A well-named class, function, or variable is better than a comment.
- Search for existing functions and reuse them where possible, refactoring them if the old functionality and new desired functionality is similar.
- For changes that are fairly mechanical across 10 or more locations, prefer to create a temporary script that makes the change in one shot.

# Building and Testing Code

- When writing tests, ask what Kent Beck would do. Practice TDD. Make sure you have a failing test that demonstrates a feature or bug _before_ you write the implementation or fix.
- Tests do not need to be exhaustive. Their purpose is to demonstrate that behaviour works, not to prove it mathematically.
- Test names should describe the intended behaviour.
  - It should be possible to understand the implementation's expected behaviour from the test names alone.
  - Having said that, always follow the naming convention of the test files we edit.

# Tool Use

- Never recursively scan broad locations such as `~` or `/`.
- Don't install global packages or modify system configuration without explicit approval.

# Git

- Always use use conventional commits
- Always prefix branches with `lail/`
- When I refer to repos (e.g. `java` or `cash-server`) they are often cloned locally to ~/Development. Look in those directories before searching remotely.

# Reviewing Code

- When asked to consider code review findings on a PR, consider whether the finding is increasing the scope of the PR. If it is, push back or proceed cautiously.

# Pull Requests

- PR descriptions should be as terse as commit messages
  - Skip section headers (`## Summary`, `## Test plan`, etc.) unless a section genuinely earns its keep. A few sentences without scaffolding is the norm.
  - Don't restate what the diff already shows: no file lists, no tables, no counts of touched lines.
  - Don't include a test-plan checklist unless the reviewer needs specific guidance beyond "CI runs the tests."
  - Structure: one sentence on the problem, one on the fix, and (if it matters) one on the safety/impact ("No behavioural changes.", "Ships behind a flag.", "Requires schema migration first."). If a single paragraph covers it, don't reach for bullets.
  - When iterating on a PR, keep its description current. Describe the present result, not the history of earlier iterations.
- If you mention a feature flag, always make it a link to the flag.

