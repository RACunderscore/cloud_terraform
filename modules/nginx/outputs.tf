
output "container_names" {
  value = docker_container.nginx[*].name
}

output "container_ports" {
  value = [
    for container in docker_container.nginx :
    container.ports[0].external
  ]
}
