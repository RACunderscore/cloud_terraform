
variable "image_used" {
  description = "Docker image to use"
  type        = string
  default     = "nginx:latest"

  validation {
    condition     = length(var.image_used) > 0
    error_message = "The Docker image name cannot be empty."
  }
}

variable "is_privileged" {
  description = "Run containers in privileged mode"
  type        = bool
  default     = false
}

variable "nb_containers" {
  description = "Number of Nginx containers"
  type        = number
  default     = 1

  validation {
    condition     = var.nb_containers >= 1 && var.nb_containers <= 10
    error_message = "The number of containers must be between 1 and 10."
  }
}

variable "port" {
  description = "Starting external port"
  type        = number
  default     = 3000

  validation {
    condition     = var.port >= 1024 && var.port <= 65535
    error_message = "The port must be between 1024 and 65535."
  }
}
