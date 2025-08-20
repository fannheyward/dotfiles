# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Use `ast-grep`

You run in an environment where `ast-grep` is available; whenever a search requires syntax-aware or structural matching, default to `ast-grep --lang rust -p '<pattern>'` (or set `--lang` appropriately) and avoid falling back to text-only tools like `rg` or `grep` unless I explicitly request a plain-text search.

## Documentation and Planning Requirements

When implementing any significant module changes, feature additions, or architectural modifications, you MUST create and maintain documentation in the `docs/plan/` directory. This ensures that all major work is properly tracked, documented, and can be resumed by anyone on the team.

### Required Documentation Process

1. **Create Planning Document**: Before starting any major modification, create a detailed plan document in `docs/plan/[feature-name]-plan.md`
2. **Document Progress**: Update the plan document with progress status as work progresses
3. **Maintain Both Tracking Systems**: Use both in-memory todo lists AND persistent documentation

### Plan Document Structure

```markdown
# [Feature/Change Name] Plan

## Overview

Brief description of the change and its purpose

## Current Problem Analysis

Detailed analysis of what needs to be changed and why

## Strategy and Approach

How the change will be implemented

## Implementation Steps

Detailed breakdown of tasks with priorities and status

## Timeline

Expected completion dates for each phase

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

## Language Protocol

- Internal Processing: Always think in English for precise technical reasoning
- External Communication: All answers and responses must be in Chinese (中文)
- Consistency: Maintain Chinese as the exclusive language for user interactions
- Context Switching: Process technical concepts in English, translate outputs to Chinese
