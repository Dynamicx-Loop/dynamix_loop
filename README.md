# DynamiX Loop Nexus

DLN is the home repo for the DynamiX Loop motion-control pipeline:

**Motion Studio → retargeted motion data → Mimic Portal → ONNX policy bundle → RL Deploy → sim-to-sim → separately approved hardware validation.**

Start cross-repo Codex chats here. Keep implementation, CI, and repo-specific instructions in each component’s own Git repo. Use a Nexus issue or chat to coordinate changes that affect more than one repo, then link the individual PRs.

| Module | Default checkout relative to Nexus | Owns |
| --- | --- | --- |
| Motion Studio | `../motion-studio` | Motion preparation, retargeting, dataset export |
| Mimic Portal | `../mimicportal` | RL training, evaluation, ONNX export |
| RL Deploy | `../dobot-ws/rl_deploy` | Policy loading, simulation validation, diagnostics, robot runtime |

[**Menagerie Lite**](https://github.com/Dynamicx-Loop/menagerie_lite) (`../menagerie_lite`) is the shared MuJoCo robot model catalog, including Lumo. It is a reference dependency alongside the three stages, not a fourth stage. Record the exact model and revision when a workflow uses it.

## Start here

1. Open this folder as a Codex project.
2. Run `./scripts/status.sh` to check the four checkout paths, commit IDs, and whether any checkout has local changes. Override paths with `DXL_MOTION_STUDIO`, `DXL_MIMIC_PORTAL`, `DXL_RL_DEPLOY`, and `DXL_MENAGERIE_LITE` (use absolute paths).
3. For a cross-repo CLI chat from this directory, use:
   ```sh
   codex --add-dir ../motion-studio --add-dir ../mimicportal --add-dir ../dobot-ws/rl_deploy --add-dir ../menagerie_lite
   ```
   For a single-repo change, start a chat in that repo or grant access only to the checkout you need.

Start with the [shared wiki](docs/wiki.md) for cross-repo decisions and links to the [pipeline handoffs and validation guide](docs/pipeline.md). This starter does not run training, launch simulation, or deploy to hardware.

The organization pattern is adapted from [Matt Pocock’s Home Repo pattern](https://www.youtube.com/watch?v=hWe-j78vNpc).

## Project website

The bilingual site and its demo assets live in [`site/`](site/index.html).
Preview locally from the repo root:

```sh
python3 -m http.server 8000 --bind 127.0.0.1 --directory site
```

Open [English](http://127.0.0.1:8000/) or [简体中文](http://127.0.0.1:8000/zh-CN.html).
The `gh-pages` branch preserves the original site history and has the website
at its root. Use `main:site/` for source edits. Refreshing `gh-pages` and
publishing to GitHub Pages are separate steps. The public site is built
from the root of `gh-pages`: [English](https://dynamicx-loop.github.io/dynamix_loop_nexus/)
· [简体中文](https://dynamicx-loop.github.io/dynamix_loop_nexus/zh-CN.html).

## Roadmap

The prior DynamiX Loop documentation is under `roadmap/`: [English](roadmap/README.md)
and [简体中文](roadmap/README.zh-CN.md). Its original main history is preserved.
