// param <parameter-name> <parameter-data-type> = <default-value>

// decorators
@description('Location input')
@allowed([
  'westeurope'
  'northeurope'
])
param parLocation string

@secure()
param parPassword string

@minLength(4)
@maxLength(10)
param parUserName string
