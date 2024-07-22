locals {
  adouPath                   = "OU=${var.siteId},${var.adouSuffix}"
  aksArcName                 = "${var.siteId}-aksArc"
  clusterName                = "${var.siteId}-cl"
  customLocationName         = "${var.siteId}-customlocation"
  dataCollectionEndpointName = "${var.siteId}-dce"
  dataCollectionRuleName     = "AzureStackHCI-${var.siteId}-dcr"
  deploymentUserName         = "${var.siteId}deploy"
  domainJoinUserName         = "${var.siteId}vmuser"
  keyvaultName               = "${var.siteId}-kv"
  logicalNetworkName         = "${var.siteId}-logicalnetwork"
  randomSuffix               = true
  resourceGroupName          = "${var.siteId}-rg"
  siteDisplayName            = var.siteId
  siteResourceName           = length(var.siteId) < 4 ? "${var.siteId}-site" : "${var.siteId}"
  vmAdminUsername            = "${var.siteId}admin"
  vmName                     = "${var.siteId}-vm"
  witnessStorageAccountName  = "${lower(var.siteId)}wit"
  workspaceName              = "${var.siteId}-workspace"
}
