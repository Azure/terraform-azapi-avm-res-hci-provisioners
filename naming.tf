locals {
  adou_path            = "OU=${var.site_id},${var.adou_suffix}"
  cluster_name         = "${var.site_id}-cl"
  deployment_user_name = "${var.site_id}deploy"
  resource_group_name  = "${var.site_id}-rg"
}
