resource "hcloud_primary_ip" "docker_host" {
  count         = var.docker_host_count
  name          = format(local.resource_name_templates.ipv4, count.index + 1)
  datacenter    = "nbg"
  type          = "ipv4"
  assignee_type = "server"
  auto_delete   = true
  labels = {
    purpose = "docker-host"
  }
}

resource "hcloud_server" "docker_host" {
  count       = var.docker_host_count
  name        = format(local.resource_name_templates.server, count.index + 1)
  server_type = "cx11"
  image       = "docker-ce"
  location    = "nbg"
  user_data   = file("data/cloud-init.yml")
  labels = {
    purpose = "docker-host"
  }

  public_net {
    ipv4         = hcloud_primary_ip.docker_host[count.index].id
    ipv4_enabled = true
    ipv6_enabled = false
  }
}
