Import-AzureRmContext -Path C:\encrypted\AzureProfile.json
$state = read-host "Do you want to start or stop application servers? (start/stop)"
if ($state.tolower() -eq 'start' -or $state.tolower() -eq 'stop') {
	$proceed = $true
}
if ($proceed) {
    Connect-AzureRmAccount -Tenant "6654a909-f0e2-49eb-a847-701aa58a0312" -SubscriptionId "645716b6-117f-45d2-bdf5-0d79a7a0bd74"
	$resourcegroupname = 'LIGHTPOINTFT-PoC-WestUS'
	$servers = @(
    'LP-FILE01'
    'LP-POC-APP01'
    'LP-POC-SQL01'
    'LP-POC-XA01'
    'LP-WEB01'
    )
	if ($state.tolower() -eq 'stop') {
    	.\start-stop-vm-poc.ps1 -state 'stop' -servers $servers -resourcegroupname $resourcegroupname
	}
	if ($state.tolower() -eq 'start') {
    	.\start-stop-vm-poc.ps1 -state 'start' -servers $servers -resourcegroupname $resourcegroupname
	}	
}
