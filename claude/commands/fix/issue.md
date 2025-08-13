---
allowed-tools: Bash(git add:*), Bash(git diff:*), Bash(git status:*), Bash(git commit:*), Bash(gh issue view:*)
description: View and fix the given GitHub issue
---

# Fix GitHub Issue

Analyze and fix the GitHub issue: $ARGUMENTS.

## Workflow

1. **Check issue details** - Use `gh issue view` to get the issue description and context.
2. **Understand the problem** - Read the issue carefully to understand the problem being reported.
3. **Search for related files** - Identify which files in the codebase are related to the issue.
4. **TDD Implementation** - Follow the Test-Driven Development (TDD) process:
    1. **@tech-lead-reviewer** - Analyze issue scope and implementation strategy
    2. **Red** - Add failing test that reproduces issue (don't modify existing tests)
    3. **Green** - Implement minimal fix to make test pass
    4. **Review** - Use specialized agents:
       - **@code-reviewer** - Comprehensive code review before integration
       - **@security-reviewer** - For auth/sensitive/external-input code
       - **@ux-reviewer** - For UI/UX-impacting changes
    5. **Refactor** - **@code-simplifier** to improve code while keeping tests green
    6. **Commit** - Atomic commits following Conventional Commits
5. **Branching** - Create a new branch for the fix, e.g., `fix/issue-123`.
6. **Testing** - Write and run tests to verify the fix.
7. **Linting and Type Checking** - Ensure the code passes lint checks and type checks.
8. **Commit Message** - Create a descriptive commit message, one logical change per commit with conventional messages.
9. **No Direct Pushes** - DO NOT direct pushes to master/main branch; use pull requests for changes.

Remember to use the GitHub CLI (`gh`) for all tasks related to GitHub.
