RESOURCE_GROUP=MC_teamResources_aksohteam3_northeurope
SUBID=2009f869-247e-4bfb-ab22-d55b89f1e2ec
clientId=214002bd-a2b7-4c88-ab96-f509b25365ea
identityName=adidentitykv
resourceGroupName=teamResources

az role assignment create --role "Managed Identity Operator" --assignee $clientId --scope /subscriptions/$SUBID/resourcegroups/$RESOURCE_GROUP

az role assignment create --role "Virtual Machine Contributor" --assignee $clientId --scope /subscriptions/$SUBID/resourcegroups/$RESOURCE_GROUP

az identity create -g $resourceGroupName -n $identityName


{
  "clientId": "d985a768-60fd-4fff-8a61-1d7e13a33309",
  "clientSecretUrl": "https://control-northeurope.identity.azure.net/subscriptions/2009f869-247e-4bfb-ab22-d55b89f1e2ec/resourcegroups/teamResources/providers/Microsoft.ManagedIdentity/userAssignedIdentities/adidentitykv/credentials?tid=af2e7cb2-62cc-471a-951a-f1c6a6c9527a&oid=28a452e4-89f4-4e1a-aff2-749171e8a37d&aid=d985a768-60fd-4fff-8a61-1d7e13a33309",
  "id": "/subscriptions/2009f869-247e-4bfb-ab22-d55b89f1e2ec/resourcegroups/teamResources/providers/Microsoft.ManagedIdentity/userAssignedIdentities/adidentitykv",
  "location": "northeurope",
  "name": "adidentitykv",
  "principalId": "28a452e4-89f4-4e1a-aff2-749171e8a37d",
  "resourceGroup": "teamResources",
  "tags": {},
  "tenantId": "af2e7cb2-62cc-471a-951a-f1c6a6c9527a",
  "type": "Microsoft.ManagedIdentity/userAssignedIdentities"
}

principalId=28a452e4-89f4-4e1a-aff2-749171e8a37d
clientId=d985a768-60fd-4fff-8a61-1d7e13a33309

az role assignment create --role "Reader" --assignee $principalId --scope /subscriptions/$SUBID/resourceGroups/$resourceGroupName/providers/Microsoft.KeyVault/vaults/Team3hackkv

az keyvault set-policy -n Team3hackkv --secret-permissions get --spn $clientId
az keyvault set-policy -n Team3hackkv --key-permissions get --spn $clientId


AKSClusterName=aksohteam3

az aks show -g $resourceGroupName -n $AKSClusterName --query servicePrincipalProfile.clientId -otsv
az aks show -g $resourceGroupName -n $AKSClusterName --query identityProfile.kubeletidentity.clientId -otsv


export SUBSCRIPTION_ID="2009f869-247e-4bfb-ab22-d55b89f1e2ec"
export RESOURCE_GROUP="teamResources"
export CLUSTER_NAME="aksohteam3"

# Optional: if you are planning to deploy your user-assigned identities
# in a separate resource group instead of your node resource group
#export IDENTITY_RESOURCE_GROUP="<IdentityResourceGroup>"

curl -s https://raw.githubusercontent.com/Azure/aad-pod-identity/master/hack/role-assignment.sh | bash

Retrieving your node resource group
Retrieving your cluster identity ID, which will be used for role assignment
Checking if the aks cluster is using managed identity
Assigning 'Managed Identity Operator' role to 214002bd-a2b7-4c88-ab96-f509b25365ea
{
  "canDelegate": null,
  "condition": null,
  "conditionVersion": null,
  "description": null,
  "id": "/subscriptions/2009f869-247e-4bfb-ab22-d55b89f1e2ec/resourcegroups/MC_teamResources_aksohteam3_northeurope/providers/Microsoft.Authorization/roleAssignments/78f836cd-9657-4814-90a8-74af80876339",
  "name": "78f836cd-9657-4814-90a8-74af80876339",
  "principalId": "96af174b-ee06-4a2f-9286-7ef138652464",
  "principalName": "214002bd-a2b7-4c88-ab96-f509b25365ea",
  "principalType": "ServicePrincipal",
  "resourceGroup": "MC_teamResources_aksohteam3_northeurope",
  "roleDefinitionId": "/subscriptions/2009f869-247e-4bfb-ab22-d55b89f1e2ec/providers/Microsoft.Authorization/roleDefinitions/f1a07417-d97a-45cb-824c-7a7467783830",
  "roleDefinitionName": "Managed Identity Operator",
  "scope": "/subscriptions/2009f869-247e-4bfb-ab22-d55b89f1e2ec/resourcegroups/MC_teamResources_aksohteam3_northeurope",
  "type": "Microsoft.Authorization/roleAssignments"
}
Assigning 'Virtual Machine Contributor' role to 214002bd-a2b7-4c88-ab96-f509b25365ea
{
  "canDelegate": null,
  "condition": null,
  "conditionVersion": null,
  "description": null,
  "id": "/subscriptions/2009f869-247e-4bfb-ab22-d55b89f1e2ec/resourcegroups/MC_teamResources_aksohteam3_northeurope/providers/Microsoft.Authorization/roleAssignments/82627835-aece-4062-9e8e-c41654af56b3",
  "name": "82627835-aece-4062-9e8e-c41654af56b3",
  "principalId": "96af174b-ee06-4a2f-9286-7ef138652464",
  "principalName": "214002bd-a2b7-4c88-ab96-f509b25365ea",
  "principalType": "ServicePrincipal",
  "resourceGroup": "MC_teamResources_aksohteam3_northeurope",
  "roleDefinitionId": "/subscriptions/2009f869-247e-4bfb-ab22-d55b89f1e2ec/providers/Microsoft.Authorization/roleDefinitions/9980e02c-c2be-4d73-94e8-173b1dc7cf3c",
  "roleDefinitionName": "Virtual Machine Contributor",
  "scope": "/subscriptions/2009f869-247e-4bfb-ab22-d55b89f1e2ec/resourcegroups/MC_teamResources_aksohteam3_northeurope",
  "type": "Microsoft.Authorization/roleAssignments"
}