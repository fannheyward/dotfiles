# CLAUDE.md

This file provides **global** guidance for Claude Code(claude.ai/code), including baseline rules, documentation standards, planning requirements, programming philosophy, languages and tools requirements. You must also refer local CLAUDE.md files for project-specific guidelines.

## BASELINE

- Rule 1: Think Before Coding. No silent assumptions. State what you're assuming. Surface tradeoffs. Ask before guessing. Push back when a simpler approach exists.
- Rule 2: Simplicity First. Minimum code that solves the problem. No speculative features. No abstractions for single-use code. If a senior engineer would call it overcomplicated — simplify.
- Rule 3: Surgical Changes. Touch only what you must. Don't "improve" adjacent code, comments, or formatting. Don't refactor what isn't broken. Match existing style.
- Rule 4: Goal-Driven Execution. Define success criteria. Loop until verified. Check what success looks like and iterate.

## Programming Philosophy and Quality

- Code is written for humans to read and maintain first; machine execution is a byproduct
- Priority: readability and maintainability > correctness (including edge cases and error handling) > performance > code length
- Strictly follow idiomatic community best practices
- Avoid duplicated/copy-paste, unclear messy abstractions, over-engineering and unnecessary complexity without real benefit

## Language Requirements

- Internal Processing: Always think in English for precise technical reasoning
- External Communication: All answers and responses must be in Chinese
- Context Switching: Process technical concepts in English, translate outputs to Chinese
- All code, comments, identifiers/variables etc, use English only
- Comments should explain **why** rather than restating **what**

## Tools Requirements

### Prefer built-in tools over shelling out (token efficiency)

The built-in tools return structured, auto-truncated output and cost far fewer
tokens than piping raw shell output into context. Use them as the default:

- Read a file → **`view`** tool, not `cat`/`head`/`tail`/`sed -n` (use `view`'s line-range for large files instead of dumping the whole file).
- Search file contents → **`grep`** tool, not `grep`/`rg` in `bash`.
- Find files by name/pattern → the file-search tool, not `find`/`fd`/`ls`.

Reach for `bash` only when a tool genuinely cannot do the job, or for batching
related shell steps.

### Shell command execution

Use `bash` for commands that actually *do* something (git, builds, tests, package managers), not for reading or searching files:

- `rtk`: prefix real shell commands with `rtk` for token efficiency, unless full output is explicitly needed (e.g. `rtk git diff`)
- `jq`: JSON processor
- `yq`: YAML/TOML/XML/INI processor
- `gh`: GitHub CLI to view issue details, PR information and more
- `ast-grep`: syntax-aware or structural code searches when the plain-text `grep` tool is not enough; default to `ast-grep --lang <lang> -p '<pattern>'`
- `fd` / `rg`: only inside a larger shell pipeline; for plain file finds or text searches, prefer the built-in file-search / `grep` tools above.

## Compact Instructions

When compressing, preserve in priority order:

1. Architecture decisions (NEVER summarize)
2. Modified files and their key changes
3. Current verification status (pass/fail)
4. Open TODOs and rollback notes
5. Tool outputs (can delete, keep pass/fail only)

## Documentation and Planning Requirements

When implementing significant module changes, feature additions, database schema updates, API migrations, security improvements, performance optimizations, or architectural refactorings, you MUST create and maintain documentation in the `docs/plan/` directory. Update the plan document with progress status as work progresses, ensures that all major work is properly tracked, documented, and can be resumed by anyone on the team. The document should(not-must) include a Mermaid diagram to illustrate the architecture/call chain.

### Plan Document Structure

```markdown
# [Feature/Change Name] Plan

## Overview

Brief description of the change and its purpose

## Current Problem Analysis

Detailed analysis of what needs to be changed and why

## Call Chain / Architecture Diagram

[mermaid diagram]

## Strategy and Approach

How the change will be implemented. High-level design and architecture decisions. Analyze the risks and consequences of different approaches and justify the chosen one

## Implementation Steps

Detailed breakdown of tasks with priorities and status

## Risk Assessment

Potential risks and mitigation strategies

## Success Criteria

How to measure successful completion

## Progress Tracking

Real-time status updates (✅ ✓ ⏳ ❌)

## Related Files

List of all files that will be modified
```

@RTK.md
