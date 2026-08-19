# AGENTS.md

This is a global agent policy used across projects; the closest project `AGENTS.md` and explicit repository conventions take precedence.

## Always Apply

- When information is incomplete, state the assumption and proceed if it is low-risk and reversible. Ask when the assumption could materially change the result or cause irreversible effects.
- Prioritize correctness and safety, then readability and maintainability, performance, and brevity.
- Before starting, define checkable success criteria. Execute and verify until they are met.
- Use Chinese for all user-facing communication.

## Subagents Rules

- This section constrains only the primary agent; sub-agents must not delegate further.
- Tasks expected to be completed within 10 minutes, involving only a single workflow, or having strong sequential dependencies must be handled directly by the primary agent without delegation.
- Only when there are at least two independently parallelizable research, implementation, or verification workflows, each expected to require more than 5 minutes, should sub-agents be proactively used.
- By default, at most two read-only sub-agents and one writing sub-agent may run simultaneously; parallel writes are permitted only when the files, shared interfaces, and project configuration do not overlap.
- Each sub-agent may take on only one clearly bounded task. By default, it should return a complete result once, with at most one additional `follow-up`; afterward, the primary agent must integrate the results and should not repeatedly reactivate the same sub-agent over an extended period.
- For non-simple development tasks, necessary research must be completed and the scope and plan clarified first. If the primary agent is not configured as `gpt-5.6-sol` + `ultra`, it may call `sol_planner` serially before implementation only when the requirements meet at least one of the following conditions and there is not yet a user-confirmed plan: high ambiguity, high risk, or involvement of multiple core modules. When the user requests confirmation, the primary agent must present the plan and wait for confirmation before delegating implementation.
- Use `luna_explorer` for read-only searches, code-path analysis, documentation checks, and analysis of logs and test results.
- Use `spark_worker` for a single micro-change with clearly defined objectives, file scope, and acceptance criteria. It must not be used when the scope is unclear, spans multiple modules, or requires complex root-cause analysis.
- Use `terra_worker` for clearly bounded implementation, fixes, and authorized verification that require deeper reasoning, span multiple files, or involve root-cause analysis.
- Combine tasks as needed for complex work: normally, begin with no more than two parallel `luna_explorer` research tasks, then have the primary agent implement or choose one of `spark_worker` and `terra_worker` to do so. If the primary agent is already Sol Ultra, it should handle planning, integration, and final acceptance itself and should not additionally call `sol_planner` or `sol_reviewer`. Do not start agents merely to fill roles.
- Implementation-oriented sub-agents proactively created by the primary agent may use only `luna_explorer`, `spark_worker`, or `terra_worker`; Sol sub-agents may use only the read-only planning agent `sol_planner` and the final-review agent `sol_reviewer`. Internal system approvals or tool agents are not subject to this restriction.
- Sub-agents must not commit, push, create pull requests, or perform other external writes; delivery operations are the responsibility of the primary agent.
- After all implementation work has stopped, the primary agent must personally inspect the actual complete diff or artifact and perform any necessary verification and corrections within the current authorization scope.
- `sol_reviewer` may be called only when the primary agent is not Sol and the changes involve security, payments, data migration, critical pre-release paths, a large diff spanning multiple core modules, or the user explicitly requests it. The primary agent should perform the final review itself for ordinary code and configuration changes.
- When calling `sol_reviewer`, it must be the last agent to write files; after it returns, the primary agent may only inspect and report. If the primary agent modifies files again, `sol_reviewer` must be called again. Any unauthorized compilation or testing must be explicitly reported as not performed.
- Do not directly accept a sub-agent’s conclusion that work is “completed.”
- Do not delegate tasks when the coordination cost is higher than the expected execution cost. While waiting for sub-agents, the primary agent should continue work that does not depend on their results, avoiding idle wait loops.
- If a specified agent is unavailable, the primary agent must continue processing and state this explicitly; it must not silently switch to another agent. When Sol Ultra planning or acceptance is required but the corresponding agent is unavailable, the primary agent must explicitly report that the relevant stage remains incomplete.

## Engineering Rules

### Code Changes

- Trace the relevant call chain, constraints, and existing implementation before editing.
- Make the smallest correct change that satisfies the requirement. Add no speculative features or single-use abstractions.
- Touch only what the task requires. Preserve unrelated changes and avoid adjacent refactoring, comment edits, or formatting changes.
- Reuse existing repository code. When no local convention exists, follow idiomatic practices for the language or framework.
- Extract a shared abstraction only when multiple real callers exist and it reduces total complexity.
- Comments explain design reasons, constraints, or counterintuitive behavior rather than restating the code.

### Code Review Verification

- Start with the smallest relevant check that proves the change, then expand verification in proportion to risk.
- Before finishing, inspect the diff and confirm that every change belongs to the task and that evidence supports every success criterion.

## Language Rules

- Follow the repository's explicit language convention. Use Chinese when no local convention exists.
- Write repository text clearly and directly in that language while preserving identifiers, commands, protocol fields, and error messages verbatim.

## Tools Selection Rules

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

Planning precedes implementation for changes that span module boundaries, alter system architecture, affect a public API, a persistent data format, or a security boundary; necessitate migration or a phased rollout; or specifically aim to enhance performance.

- Before implementation, create a plan in the current project's `docs/plan/` directory and keep it current throughout the work.
- Record the problem, architecture decisions, implementation steps, risks, success criteria, progress, and related files with enough detail for another person to resume the work.
- Include a Mermaid diagram only when it materially clarifies the call chain or architecture.
