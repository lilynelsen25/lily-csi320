# Get Login/Logoff records from Windows Events.
# Get the last 14 days.
Function GetLoginLogs($days){
$loginouts = Get-EventLog -logname System -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays($days)

$loginoutsTable = @() # Empty array

for ($i=0; $i -lt $loginouts.Count; $i++){

# Creating event property value.
$event = ""
if($loginouts[$i].InstanceID -eq 7001) {$event="Logon"}
if($loginouts[$i].InstanceID -eq 7002) {$event="Logoff"}

# Creating user property value.
$SID = New-Object System.Security.Principal.SecurityIdentifier($loginouts[$i].ReplacementStrings[1])
$User = $SID.Translate([System.Security.Principal.NTAccount])

# Adding each new line (in the form of a custom object) to our empty array.
$loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated; `
                                       "ID" = $loginouts[$i].InstanceID; `
                                    "Event" = $event; `
                                     "User" = $user;
                                     }
}
# End of for

$loginoutsTable
}
# End of function.

Function GetStartupTime($days){
$starts = Get-EventLog -logname System -After (Get-Date).AddDays($days) | Where {$_.EventID -eq "6005"}

$startsTable = @() # Empty array

for ($i=0; $i -lt $starts.Count; $i++){

# Creating event property value.
$event = ""
if($starts[$i].EventID -eq 6005) {$event="Startup"}

$user= "System"
# Adding each new line (in the form of a custom object) to our empty array.
$startsTable += [pscustomobject]@{"Time" = $starts[$i].TimeGenerated; `
                                       "ID" = $starts[$i].EventID; `
                                    "Event" = $event; `
                                     "User" = $user;
                                     }
}
# End of for

$startsTable
}
# End of function.

Function GetShutdownTime($days){
$stops = Get-EventLog -logname System -After (Get-Date).AddDays($days) | Where {$_.EventID -eq "6006"}

$stopsTable = @() # Empty array

for ($i=0; $i -lt $stops.Count; $i++){

# Creating event property value.
$event = ""
if($stops[$i].EventID -eq 6006) {$event="Shutdown"}

$user= "System"
# Adding each new line (in the form of a custom object) to our empty array.
$stopsTable += [pscustomobject]@{"Time" = $stops[$i].TimeGenerated; `
                                       "ID" = $stops[$i].EventID; `
                                    "Event" = $event; `
                                     "User" = $user;
                                     }
}
# End of for

$stopsTable
}
#End Function

