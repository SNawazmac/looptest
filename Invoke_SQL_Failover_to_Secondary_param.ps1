param(
[Parameter(Mandatory=$true)][string]$resource_group_name,              #Enter the name of resource group where the secondary sql server is existing
[Parameter(Mandatory=$true)][string]$secondary_server_name,            #Enter the secondary server name
[Parameter(Mandatory=$true)]$failover_group_name,                      #Enter the failovergroupname
[Parameter(Mandatory=$true)]$secondary_subscription_Id                 #Enter the secondary_subscription_Id                            
)

#The below command sets authentication information for cmdlets that run in the current session
Set-AzContext -Subscription $secondary_subscription_Id

#The below command invokes failover from primary to secondary sql server in the failover group
Switch-AzSqlDatabaseFailoverGroup -ResourceGroupName $resource_group_name -ServerName $secondary_server_name -FailoverGroupName $failover_group_name
