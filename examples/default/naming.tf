locals {
  adou_path                  = "OU=${local.siteId},${var.adouSuffix}"
  cluster_name               = "${local.siteId}-cl"
  customLocationName         = "${local.siteId}-customlocation"
  dataCollectionEndpointName = "${local.siteId}-dce"
  dataCollectionRuleName     = "AzureStackHCI-${local.siteId}-dcr"
  deploymentUserName         = "${local.siteId}deploy"
  domainJoinUserName         = "${local.siteId}vmuser"
  keyvaultName               = "${local.siteId}-kv"
  logicalNetworkName         = "${local.siteId}-logicalnetwork"
  randomSuffix               = true
  resourceGroupName          = "${local.siteId}-rg"
  siteDisplayName            = local.siteId
  siteId                     = "iac${var.runnumber}"
  siteResourceName           = length(local.siteId) < 4 ? "${local.siteId}-site" : "${local.siteId}"
  vmAdminUsername            = "${local.siteId}admin"
  vmName                     = "${local.siteId}-vm"
  witnessStorageAccountName  = "${lower(local.siteId)}wit"
  workspaceName              = "${local.siteId}-workspace"
}
