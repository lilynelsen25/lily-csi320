# Create folder if it does not already exist.
$folderpath="$PSScriptRoot\outfolder"
if (Test-Path $folderpath){
    Write-Host "Folder Already Exists"
}
else{
    New-Item -ItemType "directory" -Path $folderpath
}