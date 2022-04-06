resource resMyStorageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = [for i in range(0, 3): {
  name: concat(uniqueString(resourceGroup().id), 'stg', i)
  kind: 'StorageV2'
  location: 'westeurope'
  sku: {
    name: 'Standard_LRS'
  }
}]
