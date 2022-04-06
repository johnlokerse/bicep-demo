param parVirtualNetworkName string = 'vnet-hub-weu-001'
param parSubnetName string = 'vnet-hub-weu-subnet001'

resource resVirtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = if (!empty(parVirtualNetworkName)) {
  name: parVirtualNetworkName
  location: 'westeurope'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        // Conditional expression
        name: !empty(parSubnetName) ? parSubnetName : 'myFalseConditionName'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
    ]
  }
}
