targetScope = 'subscription'

param location string = 'germanywestcentral'
param resourcePrefix string = 'aksbicep'

var resourceGroupName = '${resourcePrefix}-rg'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module aks './aks-cluster.bicep' = {
  name: '${resourcePrefix}-mc'
  scope: rg
  params: {
    location: location
    clusterName: '${resourcePrefix}-cluster'
  }
}
