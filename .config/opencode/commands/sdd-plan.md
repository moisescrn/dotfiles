---
description: SDD · Generate the technical plan for an approved spec
agent: plan
---

Read `docs/constitution.md`, `AGENTS.md`, and `specs/$1/spec.md`. Use the `sdd` skill

DO NOT write code

Generate `specs/$1/plan.md` with:

- files to be created or modified and the responsibility of each one
- pure logic functions
- algorithm in pseudocode
- how it is rendered in the interface
- justified technical decisions (including the rejected alternative)
- test strategy 

Everything must comply with the constitution and cover all FRs. Mark which FR each part covers.

If the spec is not approved or has open questions, stop and notify me.
