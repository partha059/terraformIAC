terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "container1" {
  image = docker_image.nginx.image_id
  name  = "PARTHA"

  ports {
    internal = 80
    external = 8000
  }
}


resource "docker_container" "container2" {
  image = docker_image.nginx.image_id
  name  = "SUVRA"
  ports {
    internal = 81
    external = 8001
  }
}
