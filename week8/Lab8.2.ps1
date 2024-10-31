. (Join-Path $PSScriptRoot Lab_4.2.ps1)
. (Join-Path $PSScriptRoot Users.ps1)
. (Join-Path $PSScriptRoot Lab_2.4.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)

# Couldn't figure out how to fix option 2 & 3. 
# Lmk what I can do but I think I was close.

$Prompt  = "Please choose your operation:`n"
$Prompt += "1 - List last 10 Apache logs.`n"
$Prompt += "2 - List last 10 failed logons for all users`n"
$Prompt += "3 - List at risk users`n"
$Prompt += "4 - Start Chrome at Champlain Website`n"
$Prompt += "0 - Exit`n"

$operation = $true

clear

while($operation){

    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 0){
        Write-Host "Goodbye." | Out-String
        $operation = $false
    }

    elseif($choice -eq 1){
        ApacheLogs1 | Select-Object -last 10  | Format-Table -AutoSize -Wrap
    }

    elseif($choice -eq 2){
        GetFailedLogins | Select-Object -last 10
    }

    elseif($choice -eq 3){
        getFailedLogins | Group-Object Name | Where-Object $time -GT 10
    }

    elseif($choice -eq 4){
        GetChamp
    }
    else{Write-Host "Please enter a valid answers."}
}