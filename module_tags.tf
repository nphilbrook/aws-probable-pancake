data "local_file" "modules_json" {
  filename = "${path.cwd}/.terraform/modules/modules.json"
}

locals {
  modules = jsondecode(data.local_file.modules_json.content)
}

output "modules" {
  value = local.modules
}
