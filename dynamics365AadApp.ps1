$DeploymentName = "webAppNameHere"

$webapp = Get-AzureRmWebApp -Name $DeploymentName

$appPass = -join(47..126|%{[char]$_}|Get-Random -C 40)
$requiredresourceaccesses = '[{"resourceAppId": "00000002-0000-0000-c000-000000000000","resourceAccess": [{"id": "311a71cc-e848-46a1-bdf8-97ff7156d8e6","type": "Scope"}]},{"resourceAppId": "00000015-0000-0000-c000-000000000000","resourceAccess": [{"id": "6397893c-2260-496b-a41d-2f1f15b16ff3","type": "Scope"},{"id": "a849e696-ce45-464a-81de-e5c5b45519c1","type": "Scope"},{"id": "ad8b4a5c-eecd-431a-a46f-33c060012ae1","type": "Scope"}]}]' | convertto-json
$app = az ad app create --display-name $DeploymentName --identifier-uris ("https://" + $webapp.DefaultHostName + "/inbox.aspx") --password $appPass --reply-urls ("https://" + $webapp.DefaultHostName + "/inbox.aspx") --required-resource-accesses $requiredresourceaccesses --end-date ($(get-date).AddYears(20))
$appId = ($app | convertfrom-json).appId
az webapp config appsettings set -g $webapp.ResourceGroup -n $webapp.Name --settings aad_ClientId=$appId aad_ClientSecret=$appPass
