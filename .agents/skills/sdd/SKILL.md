---
name: sdd
description: Always use this when working with Spec-Driven Development in this project (`docs/constitution.md` or any file inside `specs/`) — writing, reviewing, or changing specs, plans, and tasks, or implementing and validating tasks from a spec.
---

# Spec-Driven Development (SDD)

## Workflow

Constitution → Spec → Clarification → Plan → Tasks → Implementation → Validation → Change

- Never move to the next phase without the user's explicit approval
- The spec is authorative: if something is not in the spec, it must not be implemented. If a decision is missing, stop and ask
- A requirements change must first be made in the spec, then in the plan and tasks, and finally in the code
- Each spec lives in its own folder: `specs/NNN-name/` with `spec.md`, `plan.md`, and `tasks.md`
- At the end of each phase, update `MEMORY.md`

## Spec template (spec.md)

```
# Spec NNN — <Name>

Status: draft | approved | implemented

## Context and objective
## Users
## User stories
- US-1. As a <role>, I want <action> so that <benefit>.
## Definitions (only if there are terms that could be interpreted in multiple ways)
## Functional requirements
## Non-functional requirements
## Edge cases
## Out of scope
## Completion criteria
## Open questions
- [NEEDS CLARIFICATION] <question>
```

The spec describes the WHAT and the WHY. Nothing about the stack, architecture, or file names.

## Functional Requirements in EARS (in English)

- FR-x: WHEN <event>, THE SYSTEM <response>
- FR-x: IF <undesired condition>, THEN THE SYSTEM <response>
- FR-x: WHILE <state>, THE SYSTEM <response>
- FR-x: THE SYSTEM <permanent behaviour>

Each FR must be verifiable: nothing like "fast", "intense", or "beautiful" without a measurable criterion.

## Plan (plan.md)

Files and responsibilities · Pure functions · Algorithm in pseudocode · Interface · Decisions justified with their rejected alternative · Test strategy. Indicate which FR each part covers.

## Tasks (tasks.md)

```
- [ ] **Tn. <Description>.** FR-x, FR-y
  - Done when: <verifiable check>.
```

Maximum 20–30 min per task, in dependency order. If there are more than 10, propose splitting the spec.

## Implementation
e.g.:
One task at a time: tests first (red), then the code, `node --test` green, mark the task as done, and stop.

