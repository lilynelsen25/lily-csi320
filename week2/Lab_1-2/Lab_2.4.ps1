# Starts Google Chrome on champlain.edu if not already started.
# If instance already running, stops it.

$url = "champlain.edu"
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

if(Get-Process | ?{$_.Path -eq $chromePath}){
    Stop-Process -ProcessName chrome
}
else{
    Start-Process -FilePath $chromePath $url
}