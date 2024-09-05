# Get DNS Server IPs for Ethernet interface but only show the first one.
(Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).ServerAddresses[0]