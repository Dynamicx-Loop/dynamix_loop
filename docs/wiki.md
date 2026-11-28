# DLN shared wiki

This is the starting point for decisions that affect more than one motion-control repo. The three modules are still under development. This wiki records the direction and open questions; it does not freeze an interface or describe a working orchestration system.

- [Repo map and local setup](../README.md): where each repo lives and what it owns.
- [Project website](../site/index.html): bilingual pages and demo assets. See the repo README for local preview.
- [Roadmap](../roadmap/README.md): the original bilingual DynamiX Loop documentation.
- [Agent guide](../AGENTS.md): how to work across checkouts without moving implementation into DLN.
- [Pipeline handoffs and sim-to-sim validation](pipeline.md): what to record at each boundary and how to compare the current and proposed deployment stacks.

Menagerie Lite is the shared model reference. Which model variants each pipeline stage uses, and how they map to other robot descriptions, are still open decisions.

## Open decisions

| Boundary | What remains to decide |
| --- | --- |
| Motion Studio → Mimic Portal | Which export and metadata the trainer will treat as canonical. Compare the producer's actual output with what the trainer reads before standardizing it. |
| Mimic Portal → RL Deploy | Which inputs and settings travel with the ONNX file, and which stay in deploy-side configuration. Check both sides against a known-good Lumo policy. |
| Deployment refactor | Which simulation case and tolerances are sufficient to demonstrate parity before any hardware validation. |

When a cross-repo decision is made, record what changed, why, which repo owns the change, and the test or PR that verifies it. Keep repo-specific details beside the code. Add a shared skill only once a workflow has been repeated enough to know which steps are stable.
