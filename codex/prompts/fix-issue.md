# Fix GitHub Issue

Analyze and fix the GitHub issue: $1.

## Workflow

1. **Check issue details** - Use `gh issue view` to get the issue description and context.
2. **Understand the problem** - Read the issue carefully to understand the problem being reported.
3. **Search for related files** - Identify which files in the codebase are related to the issue.
4. **TDD Implementation** - Follow the Test-Driven Development (TDD) process:
    1. **Analyze** - Analyze issue scope and implementation strategy
    2. **Red** - Add failing test that reproduces issue (don't modify existing tests)
    3. **Green** - Implement minimal fix to make test pass
    4. **Review** - Review the changes, focusing on code quality and maintainability
    5. **Refactor** - Refactor based on the review, to improve code while keeping tests green
    6. **Commit** - Atomic commits following Conventional Commits
5. **Testing** - Write and run tests to verify the fix.
6. **Linting and Type Checking** - Ensure the code passes lint checks and type checks.
7. **Branching** - Create a new branch for the fix, e.g., `fix/issue-123`.
8. **Commit Message** - Create a descriptive commit message, one logical change per commit with conventional messages.

Remember to use the GitHub CLI (`gh`) for all tasks related to GitHub.
