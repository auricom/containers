#!/usr/bin/env python3
"""Select existing Bake apps affected by a commit range."""
import argparse
import json
import re
import subprocess
from pathlib import Path


def select_apps(files, available, requested=None):
    available = set(available)
    if requested is not None:
        if not re.fullmatch(r"[a-z0-9][a-z0-9_-]*", requested) or requested not in available:
            raise ValueError(f"Unknown app: {requested}")
        return [requested]
    shared = (".github/workflows/", ".github/actions/", "tests/", ".mise/")
    if any(path.startswith(shared) or path in {"go.mod", "go.sum", "Taskfile.yaml", "scripts/select-apps.py"} for path in files):
        return sorted(available)
    return sorted({path.split("/")[1] for path in files if path.startswith("apps/") and len(path.split("/")) > 2} & available)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--app")
    parser.add_argument("--base", default="")
    parser.add_argument("--head", default="HEAD")
    args = parser.parse_args()
    available = [path.parent.name for path in Path("apps").glob("*/docker-bake.hcl")]
    files = []
    if args.app is None:
        if not args.base or set(args.base) == {"0"}:
            command = ["git", "ls-files", "-z"]
        else:
            command = ["git", "diff", "--no-renames", "--name-only", "-z", args.base, args.head, "--"]
        files = subprocess.check_output(command).decode().split("\0")
    print(json.dumps(select_apps(files, available, args.app)))
