# List all of the apache logs of xampp
# Get-Content -path C:\xampp\apache\logs\access.log

# List only the last 5 apache logs.
# Get-Content -path C:\xampp\apache\logs\access.log -Tail 5

# Display logs that only contain 404 (Not Found) and 400 (Bad Request)
# Get-Content -path C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 ',' 400 '

# Display only logs that do NOT contain 200 (OK)
# Get-Content -path C:\xampp\apache\logs\access.log | Select-String -Pattern ' 200 ' -Not Match

# From every file with a .log extension, only get logs that contain 'error'
# $A = Get-ChildItem -Path C:\xampp\apache\logs\*.log | Select-String -Pattern 'error'
# Display last 5 elements of the result array.
# $A[0..-5]

# Display IP addresses for 404 records.
$notfounds = Get-Content -path C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 '

# Define a regex for IP addresses.
$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\b"

# Get $notfounds records that match the regex
$ipsunorganized = $regex.Matches($notfounds)

# Get IPs as custom object
$ips = @()
for ($i=0; $i -lt $ipsunorganized.Count; $i++){
    $ips += [pscustomobject]@{ "IP" = $ipsunorganized[$i].Value;}
}
# $ips | Where-Object { $_.IP -ilike "10.*"}

# Count IPs for number 8.
$ipsoften = $ips | Where-Object { $_.IP -ilike "10.*"}
$counts = $ipsoften | Group IP
$counts | Select-Object Count, Name