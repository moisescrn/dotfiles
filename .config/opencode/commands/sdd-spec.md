---
description: SDD · Interview and generate the spec (usage - /sdd-spec NNN-* initial idea)
agent: plan
---

DO NOT write code at any point. Read `docs/constitution.md` and `MEMORY.md`, and use the `sdd` skill.

Spec folder: `specs/$1/`
Initial idea (the text that comes after the folder name): `$ARGUMENTS`

Your job:

1. Ask me questions ONE AT A TIME to eliminate ambiguities (edge cases, errors, what is out of scope for this version). Maximum 5 questions
2. Based on my answers, generate `specs/$1/spec.md` following the template from the `sdd` skill, with the requirements in EARS and `Status: draft`
3. Only the WHAT and the WHY: nothing about the stack, architecture, or file names
