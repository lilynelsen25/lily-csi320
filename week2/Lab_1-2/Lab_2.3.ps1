# Lists every stopped service alphabetically and saves the output to a .csv file.

cd $PSScriptRoot

$folderpath = "PSScriptRoot"
$filepath = Join-Path -Path $folderpath "stoppedServices.csv"

Get-Service | Where_Object {$_.Status -eq "stopped"} | Sort-Object | Export-Csv -Path $filepath