resource "azurerm_storage_account" "mcitstorageaccount" {
  name                     = "storageaccountmta"
  resource_group_name      = azurerm_resource_group.mcit420zz5um.name
  location                 = azurerm_resource_group.mcit420zz5um.location
  account_tier             = var.account_tier
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
variable "storage_account_names" {
  type    = list(string)
  default = [
    "storageaccountmta1",
    "storageaccountmta2",
    "storageaccountmta3",
    "storageaccountmta4",
    "storageaccountmta5"
  ]
}

resource "azurerm_storage_account" "mcitstorageaccountmta" {
  count                    = length(var.storage_account_names)
  name                     = var.storage_account_names[count.index]
  resource_group_name      = azurerm_resource_group.mcit420zz5um.name
  location                 = azurerm_resource_group.mcit420zz5um.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Processing"
  }
}
