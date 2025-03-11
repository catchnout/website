variable "hcloud_token" {
  sensitive = true
  type      = string
}

variable "env" {
  type = string
  validation {
    condition     = contains(["preview", "production"], var.env)
    error_message = "Environment must be one of 'preview', 'production'"
  }
}

variable "docker_host_count" {
  type = number
  validation {
    condition     = var.docker_host_count >= 0
    error_message = "Docker host count cannot be negative"
  }
}
