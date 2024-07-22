locals {
  dc_ip = var.virtual_host_ip == "" ? var.domain_server_ip : var.virtual_host_ip
}
# this is following https://learn.microsoft.com/en-us/azure-stack/hci/deploy/deployment-tool-active-directory
resource "terraform_data" "ad_creation_provisioner" {
  provisioner "local-exec" {
    command     = "powershell.exe -ExecutionPolicy Bypass -NoProfile -File ${path.module}/ad.ps1 -userName ${var.domain_admin_user} -password \"${var.domain_admin_password}\" -authType ${var.authentication_method} -ip ${local.dc_ip} -port ${var.dc_port} -adou_path ${var.adou_path} -domain_fqdn ${var.domain_fqdn} -ifdeleteadou ${var.destory_adou} -deployment_user ${var.deployment_user} -deployment_user_password \"${var.deployment_user_password}\""
    interpreter = ["PowerShell", "-Command"]
  }

  lifecycle {
    replace_triggered_by = [terraform_data.replacement]
  }
}
