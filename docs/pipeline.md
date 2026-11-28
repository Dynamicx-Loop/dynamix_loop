# Pipeline contracts and validation

The following are fields to capture and verify against the real code, not a specification of the formats currently implemented.

| Handoff | Record alongside the artifact |
| --- | --- |
| Motion Studio → Mimic Portal | Dataset version and location, robot model/configuration, format, joint order, units, frame conventions, sampling rate, and normalization or preprocessing |
| Mimic Portal → RL Deploy | ONNX artifact and checksum, robot configuration, observation/action names and layout, normalization and scaling, history, control rate, and expected runtime/inputs |

## Robot model provenance

If a run uses Menagerie Lite, record the Git commit, model file and variant (including hand and actuator configuration), and the scene or wrapper used in simulation. Verify compatibility in each consumer; the catalog’s presence in Nexus does not mean the three stages already load it directly.

## First integration case: deployment refactor

1. Select a known-good Lumo ONNX policy bundle and one repeatable simulation case. Record the policy hash, robot configuration, simulator and test inputs.
2. Run the current and refactored deployment paths with the same inputs. Compare input preprocessing, policy outputs, joint commands, and the simulation result. Define comparison tolerances before evaluating.
3. After this deployment-only check, run one motion from Motion Studio export through Mimic Portal training/export into deployment simulation. Track the two checks separately. Passing either is not evidence of a hardware run.

For a run record, include the three Git commit IDs, cleanliness or patch references, motion artifact ID, model artifact ID, robot config version, validation evidence, and any known limitations. Store artifacts in the approved location and track only their references here.
