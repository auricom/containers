package main

import (
	"testing"

	helpers "github.com/auricom/containers/tests"
	"github.com/stretchr/testify/require"
)

func TestToolbox(t *testing.T) {
	c := helpers.Idle(t)
	for _, path := range []string{"/usr/sbin/sshd", "/usr/bin/ssh", "/usr/bin/ssh-keygen", "/usr/local/bin/mise", "/usr/local/bin/gum"} {
		t.Run(path, func(t *testing.T) { helpers.Exec(t, c, "test", "-f", path) })
	}
	for _, path := range []string{"/mise", "/mise/shims"} {
		helpers.Exec(t, c, "test", "-d", path)
	}
	for _, path := range []string{"/usr/local/bin/mise", "/usr/local/bin/gum"} {
		require.Equal(t, "755\n", helpers.Exec(t, c, "stat", "-c", "%a", path))
	}
	commands := []struct{ command, output string }{
		{"bash --version", "GNU bash"}, {"curl --version", "curl"},
		{"exiftool -ver", ""}, {"git --version", "git version"},
		{"openssl version", "OpenSSL"}, {"mise --version", ""}, {"gum --version", ""},
		{"age --version", ""}, {"fd --version", ""}, {"gh --version", "gh version"},
		{"kubectl version --client", ""}, {"python --version", "Python 3"},
		{"rclone --version", "rclone"}, {"uv --version", ""},
		{"python -c 'import decouple'", ""}, {"python -c 'import yaml'", ""},
		{"python -c 'import requests'", ""}, {"id -un", "nonroot"},
	}
	for _, check := range commands {
		t.Run(check.command, func(t *testing.T) {
			output := helpers.Exec(t, c, "sh", "-c", check.command)
			require.Contains(t, output, check.output)
		})
	}
}
