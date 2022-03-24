@description('Location input')
@allowed([
  'westeurope'
  'northeurope'
])
param location string

@secure()
param password string
