# With help from Beth Chadbourne & Jaden Cypes

function ApacheLogs1(){
$logsNotformatted = Get-Content -path C:\xampp\apache\logs\access.log
$tableRecords = @()

for ($i=0; $i -lt $logsNotformatted.Count; $i++){

# Split string into words
$words = $logsNotformatted[$i].Split(" ")

 $tableRecords += [pscustomobject]@{ "IP" = $words[0]; `
                                     "Time" = $words[3].Trim('['); `
                                     "Method" = $words[4].Trim('"'); `
                                     "Page" = $words[6]; `
                                     "Protocol" = $words[7]; `
                                     "Response" = $words[8]; `
                                     "Referrer" = $words[10]; `
                                     "Client" = $words[11]}
} #end of for loop
 return $tableRecords | Where-Object { $_.IP -ilike "10.*" }
}