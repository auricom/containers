package main

import (
	"testing"
	"time"

	helpers "github.com/auricom/containers/tests"
	"github.com/testcontainers/testcontainers-go"
	"github.com/testcontainers/testcontainers-go/wait"
)

func TestResilioSync(t *testing.T) {
	c := helpers.Start(t,
		testcontainers.WithExposedPorts("8888/tcp"),
		testcontainers.WithWaitStrategyAndDeadline(60*time.Second,
			wait.ForListeningPort("8888/tcp"),
			wait.ForHTTP("/").WithPort("8888/tcp").WithStatusCodeMatcher(func(code int) bool { return code == 200 }),
		),
	)
	helpers.Exec(t, c, "sh", "-c", `for comm in /proc/[0-9]*/comm; do if [ "$(cat "$comm" 2>/dev/null)" = rslsync ]; then exit 0; fi; done; exit 1`)
}
