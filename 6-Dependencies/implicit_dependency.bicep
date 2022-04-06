// Implicit dependency
resource resNsg 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: 'vm-euw-nsg001'
  location: resourceGroup().location
}

resource resNsgRule 'Microsoft.Network/networkSecurityGroups/securityRules@2019-11-01' = {
  name: '${resNsg}/AllowAllRule'
  properties: {
    description: 'Allow all'
    protocol: '*'
    sourcePortRange: '*'
    destinationPortRange: '*'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 100
    direction: 'Inbound'
  }
}
