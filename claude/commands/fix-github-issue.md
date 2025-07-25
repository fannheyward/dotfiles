---
allowed-tools: Bash(git add:*), Bash(git diff:*), Bash(git status:*), Bash(git commit:*), Bash(gh issue view:*)
description: Create a git commit
---

# Fix GitHub Issue

Analyze and fix the GitHub issue: $ARGUMENTS.

Follow the following steps:

1. Use `gh issue view` to get the issue details
2. Understand the problem described in the issue
3. Search for related files in the code repository
4. Create a new branch for the fix, for example, `fix-issue-123`
5. Write and run tests to verify the fix
6. Ensure the code passes Lint checks and type checks
7. Create a descriptive commit message

Remember to use the GitHub CLI (`gh`) for all tasks related to GitHub.
