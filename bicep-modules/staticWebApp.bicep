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

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2021-12-01-preview' = {
  name: 'log-todoapp'
  location: location
  properties: {
    retentionInDays: 30
    workspaceCapping: json('0.2')
  }
}

resource insights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'appi-todoapp'
  location: location
  kind: 'web'
  properties: {
    WorkspaceResourceId: logAnalytics.id
    Application_Type: 'web'
    IngestionMode: 'LogAnalytics'
  }
}
