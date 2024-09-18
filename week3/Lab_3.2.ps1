. (Join-Path $PSScriptRoot Lab_3.1.ps1)

$logTable = GetLoginLogs(-15)
$logTable

$shutdownsTable = GetShutdownTime(-25)
$shutdownsTable

$startupTable = GetStartupTime(-25)
$startupTable