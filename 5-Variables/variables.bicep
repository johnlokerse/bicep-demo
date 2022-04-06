// var <varable-name> = <variable-value>

var varStorageAccountName = concat('sa', uniqueString(resourceGroup().id), '001')

var varStorageAccountObject = {
  location: 'westeurope'
  kind: 'Storage'
  sku: 'Standard_LRS'
}

resource resSA 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: varStorageAccountName
  location: varStorageAccountObject.location
  kind: varStorageAccountObject.kind
  sku: {
    name: varStorageAccountObject.sku
  }
}


