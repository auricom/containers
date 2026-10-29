package main

import (
	"testing"

	helpers "github.com/auricom/containers/tests"
	"github.com/stretchr/testify/require"
)

func TestMusicTranscode(t *testing.T) {
	c := helpers.Idle(t)
	require.Contains(t, helpers.Exec(t, c, "ffmpeg", "-version"), "ffmpeg version")
	for _, command := range []string{"bash", "fd", "find", "grep", "rsync", "sed", "wget", "xxhsum"} {
		helpers.Exec(t, c, "sh", "-c", "command -v "+command)
	}
}
