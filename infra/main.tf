terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "= 1.45"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "= 5"
    }
  }
  required_version = "= 1.11.1"
}

variable "hcloud_token" {
  sensitive = true
  type = string
}

provider "hcloud" {
  token = var.hcloud_token
}

variable "cloudflare_token" {
  sensitive = true
  type = string
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}