// Explicit dependency
resource resRubiconZone 'Microsoft.Network/dnsZones@2018-05-01' = {
  name: 'rubicon.nl'
  location: 'global'
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'euw-contoso'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
  dependsOn: [
    resRubiconZone
  ]
}
