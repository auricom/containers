import importlib.util
import unittest
from pathlib import Path

spec = importlib.util.spec_from_file_location("select_apps", Path(__file__).with_name("select-apps.py"))
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class SelectionTests(unittest.TestCase):
    apps = ["toolbox", "resilio-sync", "music-transcode"]

    def test_changed_apps_are_unique_and_deleted_apps_are_excluded(self):
        self.assertEqual(module.select_apps(["apps/toolbox/Dockerfile", "apps/toolbox/container_test.go", "apps/removed/Dockerfile"], self.apps), ["toolbox"])

    def test_shared_changes_validate_every_app(self):
        for path in [".github/workflows/app-builder.yaml", "tests/helpers.go", "go.sum", "Taskfile.yaml", "scripts/select-apps.py", ".mise/config.toml"]:
            with self.subTest(path=path):
                self.assertEqual(module.select_apps([path], self.apps), sorted(self.apps))

    def test_empty_and_documentation_changes(self):
        for files in [[], ["README.md", "scripts/templates/README.md.j2"]]:
            self.assertEqual(module.select_apps(files, self.apps), [])

    def test_manual_selection(self):
        self.assertEqual(module.select_apps([], self.apps, "toolbox"), ["toolbox"])
        for app in ["", "removed", "../toolbox", "toolbox resilio-sync"]:
            with self.subTest(app=app), self.assertRaises(ValueError):
                module.select_apps([], self.apps, app)


if __name__ == "__main__":
    unittest.main()
