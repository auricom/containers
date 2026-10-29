target "docker-metadata-action" {}

variable "APP" {
  default = "music-transcode"
}

variable "VERSION" {
  default = "rolling"
}

variable "SOURCE" {
  default = "https://github.com/auricom/containers/tree/main/apps/music-transcode"
}

group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]
  args = {
    VERSION = VERSION
  }
  labels = {
    "org.opencontainers.image.source" = SOURCE
  }
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
  tags = ["${APP}:${VERSION}"]
}

target "image-all" {
  inherits = ["image"]
  platforms = ["linux/amd64"]
}
