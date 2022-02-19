param location string = resourceGroup().location

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2021-12-01-preview' = {
  name: 'law-todoapp'
  location: location
  properties: {
    retentionInDays: 30
    workspaceCapping: {
      dailyQuotaGb: json('0.2')
    }
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

output appInsightsKey string = insights.properties.InstrumentationKey
output appInsightsId string = insights.id
