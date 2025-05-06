data "local_file" "modules_json" {
  filename = "${path.cwd}/.terraform/modules/modules.json"
}

locals {
  modules = jsondecode(data.local_file.modules_json.content)["Modules"]
}

output "modules" {
  value = local.modules
}

output "a_version" {
  value = local.modules[1].Version
}
