

# Create a new SQL Database Server
$dbServerVersion = "12.0" # Default version is currently 2.0, 12.0 includes SQL Server 2014 parity
$dbserver = new-azuresqldatabaseserver -location 'west Europe' -administratorlogin <login-name> -administratorloginpassword <password> -version $dbServerVersion

# $dbserver contains a SqlDatabaseServerContext which we can use to create a database
# Alternatively, create a new one...
# Get last database server name (or set it if you know it)
# $dbServerName = Get-AzureSqlDatabaseServer | % {$_.servername} | select -last 1
$dbServerName = $dbserver.ServerName
$
# Open firewall to new server for the current client (NOTE: THIS CAN TAKE UP TO 5 MINS TO TAKE EFFECT!!!)
New-AzureSqlDatabaseServerFirewallRule -ServerName $dbServerName -StartIpAddress <from-ip-adddress> -EndIpAddress <to-ip-address> -RuleName <rule-name>
# Allow all azure services to access database server
New-AzureSqlDatabaseServerFirewallRule -ServerName $dbServerName -AllowAllAzureServices

# Get credentials interactive (displays popup), use SQL Server admin username and password
$creds = get-credential

# Create a database
$ctx = New-AzureSqlDatabaseServerContext -Credential $creds -ServerName $dbServerName
$db = New-AzureSqlDatabase $ctx -DatabaseName <db-name>

# Remove a database
Remove-AzureSqlDatabase $ctx -DatabaseName <db-name>