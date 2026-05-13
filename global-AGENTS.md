# AGENTS.md

This file provides **global** guidance for Code Agent, including baseline rules, documentation standards, planning requirements, programming philosophy, languages and tools requirements. You must also refer local AGENTS.md files for project-specific guidelines.

## BASELINE

- Rule 1: Think Before Coding. No silent assumptions. State what you're assuming. Surface tradeoffs. Ask before guessing. Push back when a simpler approach exists.
- Rule 2: Simplicity First. Minimum code that solves the problem. No speculative features. No abstractions for single-use code. If a senior engineer would call it overcomplicated — simplify.
- Rule 3: Surgical Changes. Touch only what you must. Don't "improve" adjacent code, comments, or formatting. Don't refactor what isn't broken. Match existing style.
- Rule 4: Goal-Driven Execution. Define success criteria. Loop until verified. Check what success looks like and iterate.

## Documentation and Planning Requirements

When implementing any significant module changes, feature additions, or architectural modifications, you MUST create and maintain documentation in the `docs/plan/` directory. Update the plan document with progress status as work progresses, ensures that all major work is properly tracked, documented, and can be resumed by anyone on the team.

### Plan Document Structure

```markdown
# [Feature/Change Name] Plan

## Overview

Brief description of the change and its purpose

## Current Problem Analysis

Detailed analysis of what needs to be changed and why

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

### When to Create Plan Documents

- New feature implementations
- Architectural refactoring (like removing v1 dependencies)
- Database schema changes
- API version migrations
- Security enhancements
- Performance optimizations
- Major bug fixes that affect multiple components

### Documentation Maintenance

- Update progress markers in real-time as tasks complete
- Record any deviation from original plan with reasoning
- Document lessons learned and implementation notes
- Keep status current for team visibility

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

- `jq`: JSON processor
- `yq`: YAML/TOML/XML/INI processor
- `fd`: find files in local codebase
- `rg`: ripgrep for plain-text searches
- `gh`: GitHub CLI to view issue details, PR information and more
- `ast-grep`: syntax-aware or structural code searches, default to `ast-grep --lang ts -p '<pattern>'` (or set `--lang` appropriately)
