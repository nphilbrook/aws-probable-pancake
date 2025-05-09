data "local_file" "modules_json" {
  filename = "${path.cwd}/.terraform/modules/modules.json"
}

locals {
  modules     = jsondecode(data.local_file.modules_json.content)["Modules"]
  verison_map = { for m in local.modules : m.Key => m.Version if lookup(m, "Version", null) != null }
}
