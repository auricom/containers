#!/usr/bin/env python3
"""Render the README inventory from the committed Docker Bake definitions."""
import json
import subprocess
from pathlib import Path

root = Path(__file__).resolve().parent.parent
rows = []
for bake in sorted((root / "apps").glob("*/docker-bake.hcl")):
    app = bake.parent.name
    options = json.loads(subprocess.check_output(["docker", "buildx", "bake", "image-all", "--print"], cwd=bake.parent))
    platforms = ", ".join(options["target"]["image-all"]["platforms"])
    rows.append(f"[{app}](https://github.com/auricom/containers/pkgs/container/{app}) | {platforms} | ghcr.io/auricom/{app}")
template = (root / "scripts/templates/README.md.j2").read_text()
(root / "README.md").write_text(template.replace("{{ image_inventory }}", "\n".join(rows)))
