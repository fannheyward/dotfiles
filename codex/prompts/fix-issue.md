# Fix GitHub Issue

Analyze and fix the GitHub issue: $1.

## Workflow

1. **Check issue details** - Use `gh issue view $1` to understand the problem and context.
2. **Identify files** - Locate the relevant files in the codebase that need modification.
3. **Implement and Verify** - Implement a minimal, high-quality fix. Ensure the code is clean, maintainable, and follows existing coding styles. Verify that it passes all CI checks, including linting and testing.
4. **Commit changes** - Create a new branch using the format `fix/issue-$1`, and commit your work with a clear, descriptive and conventional commit message.

Remember to use the GitHub CLI (`gh`) for all tasks related to GitHub.
