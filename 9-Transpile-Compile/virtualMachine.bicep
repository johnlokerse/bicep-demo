@description('Resource name prefixes')
param parPrefix string

resource resVnet 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: '${parPrefix}nic001'
  location: 'westeurope'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: '${parPrefix}subnet001'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
    ]
  }
}


resource resNIC 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: '${parPrefix}nic001'
  location: 'westeurope'
  properties: {
    ipConfigurations: [
      {
        name: '${parPrefix}ipconfig001'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: resVnet.id
          }
        }
      }
    ]
  }
}

resource resVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: '${parPrefix}vm001'
  location: 'westeurope'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_A2_v2'
    }
    osProfile: {
      computerName: 'demovm'
      adminUsername: 'demouser'
      adminPassword: 'demouser123!'
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '16.04-LTS'
        version: 'latest'
      }
      osDisk: {
        name: 'o${parPrefix}osdisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: resNIC.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: 'storageUri'
      }
    }
  }
}

