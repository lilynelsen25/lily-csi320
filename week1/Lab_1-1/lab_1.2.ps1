# Get IPv4 Prefix Length from Ethernet0 Interface
(Get-NetIPAddress -AddressFamily IPv4 | where {$_.InterfaceAlias -ilike "Ethernet0"}).PrefixLength