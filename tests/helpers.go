// Package helpers contains the common container lifecycle used by app tests.
package helpers

import (
	"io"
	"os"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/testcontainers/testcontainers-go"
	tcexec "github.com/testcontainers/testcontainers-go/exec"
	"github.com/testcontainers/testcontainers-go/log"
	"github.com/testcontainers/testcontainers-go/wait"
)

// Start runs TEST_IMAGE and registers cleanup even when startup fails.
func Start(t *testing.T, opts ...testcontainers.ContainerCustomizer) testcontainers.Container {
	t.Helper()
	image := os.Getenv("TEST_IMAGE")
	require.NotEmpty(t, image, "set TEST_IMAGE to the locally built image")
	opts = append([]testcontainers.ContainerCustomizer{testcontainers.WithLogger(log.TestLogger(t))}, opts...)
	c, err := testcontainers.Run(t.Context(), image, opts...)
	testcontainers.CleanupContainer(t, c)
	require.NoError(t, err)
	return c
}

// Idle starts CLI images long enough to execute their smoke checks.
func Idle(t *testing.T) testcontainers.Container {
	t.Helper()
	return Start(t,
		testcontainers.WithEntrypoint("tail"),
		testcontainers.WithEntrypointArgs("-f", "/dev/null"),
		testcontainers.WithWaitStrategy(wait.ForExec([]string{"true"}).WithStartupTimeout(60*time.Second)),
	)
}

// Exec requires success and returns the command output for further assertions.
func Exec(t *testing.T, c testcontainers.Container, cmd ...string) string {
	t.Helper()
	code, reader, err := c.Exec(t.Context(), cmd, tcexec.Multiplexed())
	require.NoError(t, err)
	output, err := io.ReadAll(reader)
	require.NoError(t, err)
	require.Equal(t, 0, code, "command %v failed: %s", cmd, output)
	return string(output)
}
