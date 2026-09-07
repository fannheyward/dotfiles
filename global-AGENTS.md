# AGENTS.md

This is a cross-project agent policy; explicit user instructions and the closest repository `AGENTS.md` or conventions take precedence.

## Always Apply

- When information is incomplete, state the assumption and proceed only when it is low-risk and reversible; ask before assumptions that could materially change the result or cause irreversible effects.
- Prioritize correctness and safety, then readability and maintainability, performance, and brevity.
- Define checkable completion criteria proportional to the task. Continue through implementation, relevant verification, and corrections within the authorized scope until those criteria are met.
- Use Chinese for user-facing communication unless the user or the closest repository convention requests another language.

## Sub-agent Workflow

### Delegation Gate

- These rules constrain the primary agent. Sub-agents must not delegate further.
- Handle a task directly when it is expected to take no more than 10 minutes, has only one workflow, or has strong sequential dependencies.
- Proactively delegate only when at least two research, implementation, or verification workflows are independently parallelizable and each is expected to take more than 5 minutes.
- Before delegating implementation for a non-simple development task, complete the necessary research and clarify the scope and plan.
- Exception: after that research, a primary agent that is not `gpt-5.6-sol` with `ultra` reasoning may call `planner` serially to produce the plan when the task has high ambiguity, high risk, or multiple core modules. This exception applies even when the normal delegation gate is not met, but not after the user has confirmed a plan.
- If the user requests plan confirmation, present the plan and wait for confirmation before delegating implementation.
- By default, run at most two read-only sub-agents and one writing sub-agent at once. Parallel writers must not overlap in files, shared interfaces, or project configuration.
- Give each sub-agent one bounded task. Expect one complete result and allow at most one follow-up.

### Role Selection

- Use `explorer` for read-only searches, call-chain analysis, documentation checks, and log or test-result analysis.
- Use `worker` for a bounded implementation or fix that needs deeper reasoning, spans multiple files, or includes root-cause analysis and authorized verification.
- For complex work, normally begin with no more than two parallel `explorer` tasks, then have the primary agent implement or delegate to one `worker`.
- Delegate proactive implementation only to `worker`. Use `explorer` for read-only exploration, the read-only `planner` for planning, and the read-only `reviewer` for final review. Internal tool or approval agents are outside this restriction.
- A primary agent already running `gpt-5.6-sol` with `ultra` reasoning handles planning, integration, and final acceptance itself and does not call `planner` or `reviewer`.

### Acceptance and Delivery

- Sub-agents must not commit, push, create pull requests, or perform other external writes. The primary agent owns delivery.
- After implementation stops, the primary agent must inspect the complete diff or artifact and perform the necessary verification and corrections within the authorized scope.
- Call `reviewer` only when the primary agent is not `gpt-5.6-sol` with `ultra` reasoning and at least one condition applies: the change involves security, payments, data migration, a critical pre-release path, or a large diff across multiple core modules; or the user explicitly requests it.
- Give `reviewer` the original request or spec, the fixed review point, and the authorization boundaries. The reviewer must reconstruct the expected result from primary sources and independently challenge both the chosen approach and its implementation; treat the implementation plan and the primary agent's conclusions as context, not premises.
- The read-only `reviewer` must report its independent conclusion and stop without editing.
- If `reviewer` finds corrections that are already authorized and within scope, the primary agent may delegate them to one `worker`, inspect the result, and call `reviewer` again against the new fixed point. Wait for user approval before any correction that changes the approved approach or scope. After a final reviewer pass with no required correction or blocker, only inspect and report.
- Explicitly report any compilation or testing that was not performed because it lacked authorization.
- If a requested agent is unavailable, continue without silently substituting another role and report the missing stage. If required Sol planning or review is unavailable, mark that stage incomplete.

## Engineering Rules

### Code Changes

- Trace the relevant call chain, constraints, and existing implementation before editing.
- Make the smallest correct change that satisfies the requirement. Add no speculative feature or single-use abstraction.
- Touch only what the task requires. Preserve unrelated changes and avoid adjacent refactoring, comment edits, or formatting changes.
- Reuse existing repository code. When no local convention exists, follow idiomatic practices for the language or framework.
- Extract a shared abstraction only when multiple real callers exist and it reduces total complexity.

### Verification

- Use the smallest relevant checks that establish the requested behavior. Expand or repeat verification only when new changes, failures, or unresolved risks justify it.
- Before delivery, inspect the complete task-owned diff or artifact against the completion criteria. Report relevant checks that were not performed and the reason.

## Language Rules

- Follow the user's explicit language request, then the repository's explicit convention; otherwise use Chinese.
- Preserve meaningful qualifications, technical identifiers, commands, protocol fields, error messages, and attributed quotations.
- Use plain, precise language. Remove filler, decorative modifiers, repeated conclusions, and unnecessary jargon. Omit English adverbs. In Chinese, omit meaningless or decorative adverbials and complements. Use literal wording in place of metaphor, ornament, or prose that draws attention to the writer when both have the same meaning.
- Place comments at the owning boundary. Use them only for non-obvious design rationale, maintenance-relevant constraints or invalidation conditions, and counterintuitive behavior.
- Keep commit messages, code comments, and other change-related text scoped to the task and final implementation. Include only the final change, the rationale or constraints needed to understand it, and relevant verification.

## Tool Selection Rules

- Prefer structured built-in tools for viewing files, searching text, and finding paths when they are available.
- For browser access and automation, use the `ego-browser` skill to control the ego-lite browser. Do not use `agent-browser`/`Browser-Use` or other browser-access skills.
- When built-in tools are unavailable, use `rg` for content and `rg --files` for paths. Read large files by range instead of printing them in full.
- Use the shell for Git, builds, tests, package managers, and batch operations that built-in tools cannot perform efficiently.
- When a shell fallback is needed, use `jq` for JSON and `gh` for GitHub information.
- When plain-text search cannot express the required code structure, use `ast-grep --lang <language> -p '<pattern>'`.

## Context Retention Rules

For context compaction and handoffs, preserve information in priority order:

1. Preserve every architecture decision together with its rationale and constraints.
2. Preserve modified files and their key changes.
3. Preserve current verification results, including pass or failure status.
4. Preserve open tasks and rollback notes.
5. Reduce tool output to the pass or failure evidence needed to support conclusions.

## Planning and Documentation Rules

Create and maintain a plan in the current project's `docs/plan/` directory before implementation when work:

- spans module boundaries;
- changes architecture, a public API, a persistent data format, or a security boundary;
- requires migration or a staged rollout;
- specifically targets performance.

Include a Mermaid diagram only when it materially clarifies the call chain or architecture. Keep the plan proportional to the work. Record the problem, architecture decisions and rationale, implementation steps, risks and mitigations, success criteria, progress, and related files in the plan and keep it updated throughout the work, so another person can resume the work.
