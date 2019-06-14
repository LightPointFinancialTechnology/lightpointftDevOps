# 
param ( 
	[parameter(mandatory=$true)][string]$state, 
	[parameter(mandatory=$true)][array]$servers, 
	[parameter(mandatory=$true)][string]$resourcegroupname 
) 
 
foreach ($server in $servers) { 
    write-host "$server"
	if ($state -eq 'start') { 
		start-azurermvm -resourcegroupname "$($resourcegroupname)" -name "$($server)"	 
	} 
	if ($state -eq 'stop') { 
		stop-azurermvm -resourcegroupname "$($resourcegroupname)" -name "$($server)" -Force	 
	} 
} 