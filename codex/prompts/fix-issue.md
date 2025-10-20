# Fix GitHub Issue

Analyze and fix the GitHub issue: $1.

## Workflow

1. **Check issue details** - Use `gh issue view` to get the issue description and context.
2. **Understand the problem** - Read the issue carefully to understand the problem being reported.
3. **Search for related files** - Identify which files in the codebase are related to the issue.
4. **Fix Implementation** - Implement minimal fix based on the issue scope
5. **Review the changes** - Focus on code quality and maintainability
6. **Refactoring** - Refactor as needed based on the review of the changes
7. **Linting and Type Checking** - Ensure the code passes lint checks and type checks.
8. **Branching** - Create a new branch for the fix, e.g., `fix/issue-123`.
9. **Commit Message** - Create a descriptive commit message, one logical change per commit with conventional messages.

Remember to use the GitHub CLI (`gh`) for all tasks related to GitHub.
