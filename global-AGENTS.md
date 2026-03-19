# AGENTS.md

This file provides **global** guidance for Code Agent, including documentation standards, planning requirements, languages and tools requirements. You must also refer local AGENTS.md files for project-specific guidelines.

## BASELINE

- 如无必要，勿增实体
- 按需使用 Plan Mode

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

How the change will be implemented

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

## Language Requirements

- Internal Processing: Always think in English for precise technical reasoning
- External Communication: All answers and responses must be in Chinese (中文)
- Consistency: Maintain Chinese as the exclusive language for user interactions
- Context Switching: Process technical concepts in English, translate outputs to Chinese

## Tools Requirements

- `jq`: JSON processor
- `yq`: YAML/TOML/XML/INI processor
- `fd`: find files in local codebase
- `rg`: ripgrep for plain-text searches
- `gh`: GitHub CLI to view issue details, PR information and more
- `ast-grep`: syntax-aware or structural code searches, default to `ast-grep --lang ts -p '<pattern>'` (or set `--lang` appropriately)
