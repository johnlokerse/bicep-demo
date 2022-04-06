// Nested resources
resource resDnsZone 'Microsoft.Network/dnsZones@2018-05-01' = {
  name: 'dnszone.com'
  location: resourceGroup().location

  resource resARecord 'A@2018-05-01' = {
    name: 'google'
    properties: {
      TTL: 3600
      ARecords: [
        {
          ipv4Address: '142.251.36.4'
        }
      ]
    }
  }

  resource resCnameRecord 'CNAME@2018-05-01' = {
    name: 'opensource'
    properties: {
      TTL: 600
      CNAMERecord: {
        cname: 'opensource.microsoft.com'
      }
    }
  }
}
