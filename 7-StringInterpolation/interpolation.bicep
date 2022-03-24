targetScope = 'subscription'

@description('Prefix for a resource group')
param rgPreFix string = 'rg-weu-'

@description('Resource group location')
param location string = 'westeurope'

var amount = 5

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = [for n in range(0, amount): {
  name: '${rgPreFix}myworkload-${n}'
  location: location
}]
