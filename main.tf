module "nginx" {
  source = "./modules/nginx"

  image_used    = var.image_used
  is_privileged = var.is_privileged
  nb_containers = var.nb_containers
  port          = var.port
}

