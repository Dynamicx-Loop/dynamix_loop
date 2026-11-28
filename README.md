# Dynamics Loop Nexus

DLN is the home repo for the DynamiX Loop motion-control pipeline:

**Motion Studio → retargeted motion data → Mimic Portal → ONNX policy bundle → RL Deploy → sim-to-sim → separately approved hardware validation.**

Start cross-repo Codex chats here. Keep implementation, CI, and repo-specific instructions in the three existing Git repos. Use a Nexus issue or chat to coordinate changes that affect more than one repo, then link the individual PRs.

| Module | Default checkout relative to Nexus | Owns |
| --- | --- | --- |
| Motion Studio | `../motion-studio` | Motion preparation, retargeting, dataset export |
| Mimic Portal | `../mimicportal` | RL training, evaluation, ONNX export |
| RL Deploy | `../dobot-ws/rl_deploy` | Policy loading, simulation validation, diagnostics, robot runtime |

## Start here

1. Open this folder as a Codex project.
2. Run `./scripts/status.sh` to check the three checkout paths, commit IDs, and whether any checkout has local changes. Override paths with `DXL_MOTION_STUDIO`, `DXL_MIMIC_PORTAL`, and `DXL_RL_DEPLOY` (use absolute paths).
3. For a cross-repo CLI chat from this directory, use:
   ```sh
   codex --add-dir ../motion-studio --add-dir ../mimicportal --add-dir ../dobot-ws/rl_deploy
   ```
   For a single-repo change, start a chat in that repo or grant access only to the checkout you need.

See [pipeline contracts and validation](docs/pipeline.md). This starter does not run training, launch simulation, or deploy to hardware.

The organization pattern is adapted from [Matt Pocock’s Home Repo pattern](https://www.youtube.com/watch?v=hWe-j78vNpc).
