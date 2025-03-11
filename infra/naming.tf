locals {
  naming_convention = {
    environments = {
      preview    = "pv"
      production = "pd"
    }
    resources = {
      server = "vm"
      ipv4   = "ip4"
    }
    prefix = "cno"
    formats = {
      separator = "-"
      instance  = "%03v"
    }
  }

  resolved_names = {
    environment = local.naming_convention.environments[var.env]
  }

  resource_name_templates = {
    server = join(
      local.naming_convention.formats.separator,
      [
        local.naming_convention.prefix,
        local.resolved_names.environment,
        local.naming_convention.resources.server,
        local.naming_convention.formats.instance
    ])
    ipv4 = join(
      local.naming_convention.formats.separator,
      [
        local.naming_convention.prefix,
        local.resolved_names.environment,
        local.naming_convention.resources.ipv4,
        local.naming_convention.formats.instance
    ])
  }
}
