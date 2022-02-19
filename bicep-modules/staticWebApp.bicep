param location string = resourceGroup().location
@secure()
param githubToken string
@secure()
param ikey string
param appInsightsId string

resource staticWebApp 'Microsoft.Web/staticSites@2021-03-01' = {
  location: location
  name: 'stapp-todoapp'
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  tags: {
    'hidden-link: /app-insights-resource-id': appInsightsId
    'hidden-link: /app-insights-instrmentation-key': ikey
  }
  properties: {
    branch: 'main'
    repositoryUrl: 'https://github.com/bethmaloney/todo-static-web-app'
    repositoryToken: githubToken
    provider: 'GitHub'
    buildProperties: {
      appLocation: 'frontend'
      apiLocation: 'api'
      outputLocation: 'build'
    }
  }
}
