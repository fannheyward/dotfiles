# AGENTS.md

This file defines cross-project defaults. Subject to system and developer instructions, follow explicit user instructions, then the closest applicable repository `AGENTS.md` and established conventions, then these defaults.

## Always Apply

- Treat requests for action as instructions to complete the work within scope. Infer intent from the conversation.
- Resolve routine gaps with low-risk, reversible assumptions and state them when relevant. Ask when missing information could change scope, correctness, or irreversible effects; continue authorized work that does not depend on the answer.
- Carry prior authorization forward. When approval is required, prepare the authorized, reviewable work before asking. If the user requests plan confirmation, wait for it before any implementation.
- Prioritize correctness and safety, then readability and maintainability, performance, and brevity.
- Define checkable completion criteria proportional to the task and continue until they are met or a concrete blocker remains. Review-only and planning-only requests authorize their requested deliverables, not implementation.
- Incorporate follow-up instructions and answer side questions while preserving the active objective unless the user replaces or cancels it.
- User instructions take precedence over skill guidelines. If a skill causes an approval request, pause, or unfinished work, link its exact `SKILL.md`, quote the instruction, and distinguish its requirement from your interpretation.

## Sub-agent Workflow

### Delegation Gate

- These rules govern agents dispatched by the primary agent; internal tool and approval agents are outside this workflow. Sub-agents must not delegate further.
- The time and parallel-work gates below apply to proactive delegation. Explicit user role requests, required final reviews, and the planner exception below take precedence over those gates.
- Handle a task directly when it is expected to take no more than 10 minutes, has only one workflow, or has strong sequential dependencies.
- Proactively delegate only when at least two research, implementation, or verification workflows are independently parallelizable and each is expected to take more than 5 minutes.
- Before delegating implementation, complete the necessary research and settle the scope and approach.
- By default, run at most two read-only sub-agents and one writing sub-agent at once. Parallel writers must not overlap in files, shared interfaces, or project configuration.
- Give each sub-agent one bounded task with the goal, relevant evidence, dependencies, file ownership, authorized checks, and completion criteria. Allow at most one corrective follow-up per exploration, planning, or implementation assignment; then take over or report the exact blocker. Final reviews follow the correction cycle below.
- While sub-agents run, advance independent work without duplicating their assignments or editing files owned by a writer. Collect required results before dependent work or final delivery; relay user changes and stop obsolete work.
- Write legible agent messages with spaces between words and numbers.

### Role Selection

- Use `explorer` for read-only searches, call-chain analysis, documentation checks, and log or test-result analysis.
- Delegate implementation and fixes only to `worker`, with a settled approach, file allowlist, and authorized verification.
- A primary agent running `gpt-6-astra` with `xhigh` or higher reasoning handles planning unless the user requests `planner`. Other primary agents may use the read-only `planner` for high ambiguity, high risk, or multiple core modules, after research and before either implementation or plan confirmation. Use runtime model and effort information; if unavailable, plan in the primary agent.
- If a requested or required role is unavailable, report the missing stage and continue independent authorized work. Keep required planning or review marked incomplete; do not substitute another role without user approval.

### Acceptance and Delivery

- The primary agent owns integration, final acceptance, and authorized delivery. Sub-agents must not commit, push, create pull requests, or perform other external writes.
- After implementation and the primary agent's verification stop, call the read-only `reviewer` for security, payments, data migration, a critical pre-release path, a large diff across multiple core modules, or an explicit request for independent review. This requirement applies regardless of the primary model or effort. Use primary-agent review for other work.
- Give `reviewer` the original request or spec, the fixed review point, and the authorization boundaries. The reviewer must reconstruct the expected result from primary sources and independently challenge both the chosen approach and its implementation; treat the implementation plan and the primary agent's conclusions as context, not premises.
- The reviewer reports its independent conclusion and stops without editing. The primary agent or one `worker` may make corrections within the approved approach and scope, then the primary agent verifies the result and requests review against the new fixed point. Changes to the approved approach or scope require user approval.
- After a final reviewer pass with no required correction or blocker, perform only read-only inspection and authorized delivery. Further content changes require another review.

## Engineering Rules

### Code Changes

- For behavior changes, bug fixes, and performance work, trace the affected call chain, constraints, and existing implementation before editing. For other changes, inspect the relevant content and conventions.
- Make the smallest correct change that satisfies the requirement. Add no speculative feature or single-use abstraction.
- Touch only what the task requires. Preserve unrelated changes and avoid adjacent refactoring, comment edits, or formatting changes.
- Reuse existing repository code. When no local convention exists, follow idiomatic practices for the language or framework.
- Extract a shared abstraction only when multiple real callers exist and it reduces total complexity.

### Verification

- Prefer E2E tests to verify complex features. Preserve the command, setup, and results as an artifact that supports verification and repeat runs.
- When isolated tests are necessary, list failure scenarios relevant to the change before implementation. Write unit tests before the implementation they verify.
- During development, run focused checks. Run the full E2E suite only at final verification, when required by the task or repository.
- Use the smallest relevant checks that establish the requested behavior. Expand or repeat verification only when new changes, failures, or unresolved risks justify it.
- For low-impact, reversible changes, add tests only when they verify meaningful behavior beyond restating the implementation.
- After changes stop, the primary agent inspects the complete task-owned diff or artifact against the completion criteria and completes the relevant verification and corrections within scope. Report completed checks and relevant checks not performed, with reasons, including authorization limits.

## Language Rules

- Follow the user's explicit language request, then the repository's explicit convention; otherwise use Chinese.
- Preserve meaningful qualifications, technical identifiers, commands, protocol fields, error messages, and attributed quotations.
- Lead with the outcome in concise paragraphs. Use lists or tables when they aid comparison or explain a sequence. Scale detail to the task.
- Use plain, precise language. Remove filler, decorative modifiers, repeated conclusions, and unnecessary jargon. Omit English adverbs unless needed to preserve meaning or technical accuracy. In Chinese, omit meaningless or decorative adverbials and complements. Prefer literal wording when it conveys the same meaning.
- Place comments at the owning boundary. Use them only for non-obvious design rationale, maintenance-relevant constraints or invalidation conditions, and counterintuitive behavior.
- Keep commit messages, code comments, and other change-related text scoped to the task and final implementation. Include only the final change, the rationale or constraints needed to understand it, and relevant verification.

## Tool Selection Rules

- Prefer structured built-in tools for viewing files, searching text, and finding paths when they support the needed operation. Otherwise use `rg` for content and `rg --files` for paths. Read large files by range.
- For browser access and automation, use the `ego-browser` skill to control the ego-lite browser. Do not use `agent-browser`/`Browser-Use` or other browser-access skills.
- Use the shell for Git, builds, tests, package managers, and batch operations that built-in tools cannot perform efficiently.
- When a shell fallback is needed, use `jq` for JSON and `gh` for GitHub information.
- When plain-text search cannot express the required code structure, use `ast-grep --lang <language> -p '<pattern>'`.

## Context Retention Rules

For context compaction and handoffs, preserve information in priority order:

1. The active objective, latest user corrections, scope, authorization, and pending approvals.
2. Architecture decisions with their rationale and constraints.
3. Modified files, key changes, and unrelated work to preserve.
4. Verification results, remaining tasks, blockers, and rollback notes.

Keep the command and artifact references needed to verify results; summarize raw tool output.

## Planning and Documentation Rules

Create and maintain a plan in `docs/plan/` before changes to architecture, public APIs, persistent data formats, or security boundaries; migrations or staged rollouts; and performance work. Cross-module changes require a plan when they introduce shared design decisions or coordinated implementation steps.

Include a Mermaid diagram only when it materially clarifies the call chain or architecture. Keep the plan proportional to the work. Record the problem, architecture decisions and rationale, implementation steps, risks and mitigations, success criteria, progress, and related files in the plan and keep it updated throughout the work, so another person can resume the work.
