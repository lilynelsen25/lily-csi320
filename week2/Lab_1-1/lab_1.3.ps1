# Show What Classes of WIN32 Library that Starts with net
# Sort Alphabetically
Get-WmiObject -List | Where-Object {$_.Name -ilike "Win32_net*"} | Sort-Object