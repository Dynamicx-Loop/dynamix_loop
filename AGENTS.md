# Dynamics Loop Nexus (DLN) agent guide

Start with [the shared wiki](docs/wiki.md), then use [the checkout map](README.md) and [the pipeline guide](docs/pipeline.md) for cross-repo work. Before editing a module, locate and read its own applicable agent instructions, verify its Git root, and check its working tree. Preserve existing user changes. Keep implementation and per-module tests in their own repositories.

For cross-repo tasks, identify the affected handoff, agree on compatibility, and report the branches or commit IDs and evidence from each affected module. Do not change another module merely to make the interfaces look alike. Nexus may hold contracts, run records, and shared tooling, not module implementations.

Do not add datasets, model weights, credentials, or raw logs to Git. Do not initiate hardware runs, push, or publish unless separately authorized. Prefer simulation for integration checks and label what was actually validated.
