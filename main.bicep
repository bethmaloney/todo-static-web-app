targetScope = 'subscription'
@secure()
param githubToken string

param location string = 'australiaeast'

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-todoapp'
  location: location
}

module stg './bicep-modules/staticWebApp.bicep' = {
  name: 'staticWebApp'
  scope: rg
  params: {
    location: rg.location
    githubToken: githubToken
  }
}
