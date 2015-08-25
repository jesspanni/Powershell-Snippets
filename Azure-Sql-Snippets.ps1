# The name of the db to create
$dbName = "DemoDb"

# If server doesn't exist create one...
$dbServerLocation = "West Europe"
$dbServerAdminLogin = "ServerAdmin"
$dbServerAdminPassword = "Password01;"
$dbServerVersion = "12.0" # Default version is currently 2.0, 12.0 includes SQL Server 2014 parity
$dbserver = new-azuresqldatabaseserver -location $dbServerLocation -administratorlogin $dbServerAdminLogin -administratorloginpassword $dbServerAdminPassword -version $dbServerVersion

# $dbserver contains a SqlDatabaseServerContext which we can use to create a database
# Alternatively, create a new one...
# Get last database server name (or set it if you know it)
# $dbServerName = Get-AzureSqlDatabaseServer | % {$_.servername} | select -last 1
$dbServerName = $dbserver.ServerName

# Open firewall to new server for the current client (NOTE: THIS CAN TAKE UP TO 5 MINS TO TAKE EFFECT!!!)
New-AzureSqlDatabaseServerFirewallRule -ServerName $dbServerName -StartIpAddress 102.44.60.115 -EndIpAddress 102.44.60.115 -RuleName MyClientRule
# Allow all azure services to access database server
New-AzureSqlDatabaseServerFirewallRule -ServerName $dbServerName -AllowAllAzureServices

# Get credentials interactive (displays popup), use SQL Server admin username and password
$creds = get-credential

# Create the database
$ctx = New-AzureSqlDatabaseServerContext -Credential $creds -ServerName $dbServerName
$db = New-AzureSqlDatabase -ConnectionContext $ctx -DatabaseName $dbName

