targetScope = 'subscription'
@secure()
param githubToken string

param location string = 'eastasia'

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-todoapp'
  location: location
}

module logging 'bicep-modules/logging.bicep' = {
  name: 'logging'
  scope: rg
  params: {
    location: rg.location
  }
}

module staticWebApp './bicep-modules/staticWebApp.bicep' = {
  name: 'staticWebApp'
  scope: rg
  params: {
    location: rg.location
    githubToken: githubToken
    appInsightsId: logging.outputs.appInsightsId
    ikey: logging.outputs.appInsightsKey
  }
}
