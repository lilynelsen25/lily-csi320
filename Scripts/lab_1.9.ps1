# Without changing directory, find every .csv file and change it to a .log file.
$files=Get-ChildItem -Recurse -File
$files | Where-Object - {$_.Extension -creplace '.csv', '.log'}
Get-