# Get IPv4 Address from Ethernet0 Interface.
(Get-NetIPAddress -AddressFamily IPv4 | where {$_.InterfaceAlias -ilike "Ethernet0"}).IPAddress