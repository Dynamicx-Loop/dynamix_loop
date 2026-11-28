#!/bin/sh
set -eu

base=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P)
rc=0
show() {
    label=$1
    path=$2
    if ! target=$(CDPATH= cd -- "$path" 2>/dev/null && pwd -P) ||
       ! root=$(git -C "$target" rev-parse --show-toplevel 2>/dev/null) ||
       [ "$(CDPATH= cd -- "$root" && pwd -P)" != "$target" ]; then
        printf '%s: checkout missing or not a Git root (%s)\n' "$label" "$path" >&2
        rc=1
        return
    fi
    if ! head=$(git -C "$target" rev-parse --short HEAD 2>/dev/null) ||
       ! changes=$(git --no-optional-locks -C "$target" status --porcelain=v1); then
        printf '%s: unable to inspect checkout (%s)\n' "$label" "$path" >&2
        rc=1
        return
    fi
    branch=$(git -C "$target" symbolic-ref --quiet --short HEAD || printf '%s' detached)
    state=clean
    [ -z "$changes" ] || state='local changes'
    printf '%s: %s @ %s [%s]\n' "$label" "$branch" "$head" "$state"
}
show 'Motion Studio' "${DXL_MOTION_STUDIO:-$base/../motion-studio}"
show 'Mimic Portal' "${DXL_MIMIC_PORTAL:-$base/../mimicportal}"
show 'RL Deploy' "${DXL_RL_DEPLOY:-$base/../dobot-ws/rl_deploy}"
show 'Menagerie Lite' "${DXL_MENAGERIE_LITE:-$base/../menagerie_lite}"
exit "$rc"
