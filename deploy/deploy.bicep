// ============================================================================
// Deploy something
// ============================================================================

targetScope = 'subscription'

@description('Name used for res group, and base name for most resources')
param name string = 'temp-thing'

@description('Azure region for all resources')
param location string = deployment().location

// ===== Modules & Resources ==================================================

resource resGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: name
  location: location
}

module blah './modules/blah.bicep' = {
  scope: resGroup
  name: 'monitoring'
  params: {
    name: 'food-truck-logs'
  }
}

// ===== Outputs ==================================================

output someOutput string = 'hello'
