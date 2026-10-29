target "docker-metadata-action" {}

variable "APP" {
  default = "resilio-sync"
}

variable "VERSION" {
  default = split("-", PACKAGE_VERSION)[0]
}

variable "SOURCE" {
  default = "https://www.resilio.com/sync/"
}

variable "PACKAGE_VERSION" {
  // renovate: datasource=deb depName=resilio-sync registryUrl=https://linux-packages.resilio.com/resilio-sync/deb?suite=resilio-sync&components=non-free&binaryArch=amd64
  default = "3.1.2.1076-1"
}

variable "PACKAGE_SHA256" {
  default = "31b623897fef0682b97f6274d124a7d7003c5d0db47f3fe3407a5c45258fbcbb"
}

group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]
  args = {
    VERSION = VERSION
    PACKAGE_VERSION = PACKAGE_VERSION
    PACKAGE_SHA256 = PACKAGE_SHA256
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
