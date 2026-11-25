
resource "docker_image" "nginx" {
  name = var.image_used
}

resource "docker_container" "nginx" {
  count = var.nb_containers

  name       = "nginx-${count.index + 1}"
  hostname   = "nginx-${count.index + 1}"
  image      = docker_image.nginx.image_id
  privileged = var.is_privileged

  ports {
    internal = 80
    external = var.port + count.index
  }

  command = [
    "sh",
    "-c",
    "echo \"<html><body><h1>Hello from $(hostname)</h1></body></html>\" > /usr/share/nginx/html/index.html && exec nginx -g 'daemon off;'"
  ]
}
