targetScope = 'subscription'

@description('Prefix for a resource group')
param parRgPreFix string = 'rg-weu-'

@description('Resource group location')
param parLocation string = 'westeurope'

var varAmount = 5

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = [for n in range(0, varAmount): {
  name: '${parRgPreFix}myworkload-${n}'
  location: parLocation
}]
