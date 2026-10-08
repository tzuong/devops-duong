terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
}

locals {
  environment = "devops"
  network_name = "devops-web-network"
}

resource "docker_network" "web_network" {
  name = local.network_name
}

resource "docker_image" "ubuntu" {
  name         = var.ubuntu_image
  keep_locally = true
}

resource "docker_container" "web" {
  count = var.server_count

  name  = "${var.server_name}-${count.index + 1}"
  image = docker_image.ubuntu.image_id

  command = [
    "bash",
    "-c",
    "apt-get update && apt-get install -y nginx && nginx -g 'daemon off;'"
  ]

  networks_advanced {
    name = docker_network.web_network.name
  }

  ports {
    internal = 80
    external = var.web_ports[count.index]
  }

  labels {
    label = "environment"
    value = local.environment
  }

  labels {
    label = "server"
    value = "${var.server_name}-${count.index + 1}"
  }
}