# Without changing directory, find every .csv file and change it to a .log file.

$files=Get-ChildItem -Recurse -File
$files | Rename-Item -NewName {$_.Name -replace '.csv', '.log'}
Get-ChildItem -Recurse -File