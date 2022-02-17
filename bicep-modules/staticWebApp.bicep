param location string = resourceGroup().location
@secure()
param githubToken string

resource staticWebApp 'Microsoft.Web/staticSites@2021-03-01' = {
  location: location
  name: 'stapp-todoapp'
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    branch: 'main'
    repositoryUrl: 'https://github.com/bethmaloney/todo-static-web-app'
    repositoryToken: githubToken
    buildProperties: {
      appLocation: 'frontend'
      apiLocation: 'api'
      outputLocation: 'build'
    }
  }
}
