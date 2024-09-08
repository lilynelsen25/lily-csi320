cd $PSScriptRoot
$files=Get-ChildItem

$folderPath = "$PSScriptRoot/outfolder/"
$filePath = Join-Path -Path $folderPath "out.csv"

# List all the files that have the extension ".ps1" and save the results to "out.csv" file.
$files | Where-Object {$_.Extension -eq ".ps1" } | Export-Csv -Path $filePath