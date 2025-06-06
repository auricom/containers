<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./scripts/templates/README.md.j2
-->
<div align="center">


## Containers

_An opinionated collection of container images_

</div>

## Tag immutability

The containers built here do not use immutable tags, as least not in the more common way you have seen from [linuxserver.io](https://fleet.linuxserver.io/) or [Bitnami](https://bitnami.com/stacks/containers).

We do take a similar approach but instead of appending a `-ls69` or `-r420` prefix to the tag we instead insist on pinning to the sha256 digest of the image, while this is not as pretty it is just as functional in making the images immutable.

| Container                                          | Immutable |
|----------------------------------------------------|-----------|
| `ghcr.io/onedr0p/sonarr:rolling`                   | ❌         |
| `ghcr.io/onedr0p/sonarr:3.0.8.1507`                | ❌         |
| `ghcr.io/onedr0p/sonarr:rolling@sha256:8053...`    | ✅         |
| `ghcr.io/onedr0p/sonarr:3.0.8.1507@sha256:8053...` | ✅         |

_If pinning an image to the sha256 digest, tools like [Renovate](https://github.com/renovatebot/renovate) support updating the container on a digest or application version change._

## Rootless

To run these containers as non-root make sure you update your configuration to the user and group you want.

### Docker compose

```yaml
networks:
  sonarr:
    name: sonarr
    external: true
services:
  sonarr:
    image: ghcr.io/onedr0p/sonarr:3.0.8.1507
    container_name: sonarr
    user: 65534:65534
    # ...
```

### Kubernetes

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sonarr
# ...
spec:
  # ...
  template:
    # ...
    spec:
      # ...
      securityContext:
        runAsUser: 65534
        runAsGroup: 65534
        fsGroup: 65534
        fsGroupChangePolicy: OnRootMismatch
# ...
```

## Passing arguments to a application

Some applications do not support defining configuration via environment variables and instead only allow certain config to be set in the command line arguments for the app. To circumvent this, for applications that have an `entrypoint.sh` read below.

1. First read the Kubernetes docs on [defining command and arguments for a Container](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/).
2. Look up the documentation for the application and find a argument you would like to set.
3. Set the extra arguments in the `args` section like below.

    ```yaml
    args:
      - --port
      - "8080"
    ```

## Configuration volume

For applications that need to have persistent configuration data the config volume is hardcoded to `/config` inside the container. This is not able to be changed in most cases.

## Available Images

Each Image will be built with a `rolling` tag, along with tags specific to it's version. Available Images Below

Container | Channel | Image
--- | --- | ---
[babybuddy](https://github.com/auricom/pkgs/container/babybuddy) | stable | ghcr.io/auricom/babybuddy
[caddy](https://github.com/auricom/pkgs/container/caddy) | stable | ghcr.io/auricom/caddy
[filebrowser](https://github.com/auricom/pkgs/container/filebrowser) | stable | ghcr.io/auricom/filebrowser
[freac](https://github.com/auricom/pkgs/container/freac) | stable | ghcr.io/auricom/freac
[github-notifier](https://github.com/auricom/pkgs/container/github-notifier) | stable | ghcr.io/auricom/github-notifier
[kresus](https://github.com/auricom/pkgs/container/kresus) | stable | ghcr.io/auricom/kresus
[kubectl](https://github.com/auricom/pkgs/container/kubectl) | stable | ghcr.io/auricom/kubectl
[rclone](https://github.com/auricom/pkgs/container/rclone) | stable | ghcr.io/auricom/rclone
[redlib](https://github.com/auricom/pkgs/container/redlib) | stable | ghcr.io/auricom/redlib
[resilio-sync](https://github.com/auricom/pkgs/container/resilio-sync) | stable | ghcr.io/auricom/resilio-sync


## Deprecations

Containers here can be **deprecated** at any point, this could be for any reason described below.

1. The upstream application is **no longer actively developed**
2. The upstream application has an **official upstream container** that follows closely to the mission statement described here
3. The upstream application has been **replaced with a better alternative**
4. The **maintenance burden** of keeping the container here **is too bothersome**

**Note**: Deprecated containers will remained published to this repo for 6 months after which they will be pruned.

## Credits

[onedr0p](https://github.com/onedr0p/containers)