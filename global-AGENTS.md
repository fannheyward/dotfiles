# AGENTS.md

This is a cross-project agent policy; explicit user instructions and the closest repository `AGENTS.md` or conventions take precedence.

## Always Apply

- When information is incomplete, state the assumption and proceed only when it is low-risk and reversible; ask before assumptions that could materially change the result or cause irreversible effects.
- Prioritize correctness and safety, then readability and maintainability, performance, and brevity.
- Define checkable success criteria before starting, then execute and verify until they are met.
- Use Chinese for user-facing communication unless the user or the closest repository convention requests another language.

## Sub-agent Workflow

### Delegation Gate

- These rules constrain the primary agent. Sub-agents must not delegate further.
- Handle a task directly when it is expected to take no more than 10 minutes, has only one workflow, or has strong sequential dependencies.
- Proactively delegate only when at least two research, implementation, or verification workflows are independently parallelizable and each is expected to take more than 5 minutes.
- Before delegating implementation for a non-simple development task, complete the necessary research and clarify the scope and plan.
- Exception: after that research, a primary agent that is not `gpt-5.6-sol` with `ultra` reasoning may call `sol_planner` serially to produce the plan when the task has high ambiguity, high risk, or multiple core modules. This exception applies even when the normal delegation gate is not met, but not after the user has confirmed a plan.
- If the user requests plan confirmation, present the plan and wait for confirmation before delegating implementation.
- By default, run at most two read-only sub-agents and one writing sub-agent at once. Parallel writers must not overlap in files, shared interfaces, or project configuration.
- Give each sub-agent one bounded task. Expect one complete result and allow at most one follow-up.

### Role Selection

- Use `luna_explorer` for read-only searches, call-chain analysis, documentation checks, and log or test-result analysis.
- Use `spark_worker` for one clearly scoped micro-change. Do not use it for unclear scope, multiple modules, or complex root-cause analysis.
- Use `terra_worker` for a bounded implementation or fix that needs deeper reasoning, spans multiple files, or includes root-cause analysis and authorized verification.
- For complex work, normally begin with no more than two parallel `luna_explorer` tasks, then have the primary agent implement or use one of `spark_worker` and `terra_worker`.
- Proactive implementation work may use only `spark_worker` or `terra_worker`; read-only exploration may use `luna_explorer`. Sol sub-agents are limited to the read-only `sol_planner` and final `sol_reviewer`. Internal tool or approval agents are outside this restriction.
- A primary agent already running `gpt-5.6-sol` with `ultra` reasoning handles planning, integration, and final acceptance itself and does not call `sol_planner` or `sol_reviewer`.

### Acceptance and Delivery

- Sub-agents must not commit, push, create pull requests, or perform other external writes. The primary agent owns delivery.
- After implementation stops, the primary agent must inspect the complete diff or artifact and perform the necessary verification and corrections within the authorized scope.
- Call `sol_reviewer` only when the primary agent is not Sol and at least one condition applies: the change involves security, payments, data migration, a critical pre-release path, or a large diff across multiple core modules; or the user explicitly requests it.
- When `sol_reviewer` is used, it must be the last agent to write files. If the primary agent makes a correction afterward, call `sol_reviewer` again; after the final reviewer pass, only inspect and report.
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

- Start with the smallest relevant check that proves the change, then expand verification in proportion to risk.
- Before finishing, inspect the complete diff and confirm that every change belongs to the task and that the evidence supports every success criterion.

## Language Rules

- Follow an explicit user language request; otherwise follow the repository's explicit language convention, using Chinese when neither specifies a language.
- Preserve identifiers, commands, protocol fields, and error messages verbatim.
- Comments explain design reasons, constraints, or counterintuitive behavior rather than restating the code.

## Tool Selection Rules

- Prefer structured built-in tools for viewing files, searching text, and finding paths when they are available.
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

Include a Mermaid diagram only when it materially clarifies the call chain or architecture. Record the problem, architecture decisions and rationale, implementation steps, risks and mitigations, success criteria, progress, and related files in the plan and keep it updated throughout the work, so another person can resume the work.
