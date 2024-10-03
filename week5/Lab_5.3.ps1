. (Join-Path $PSScriptRoot Lab_5.2.ps1)

 $ClassTable = gatherClasses

 $ClassDays = daysTranslator $ClassTable

 # $ClassTable | Sort-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" | `
               # Where{ $_."Instructor" -ilike "Furkan Paligu" }

 # $ClassTable | Where { ($_.Location -ilike "JOYC 310") -and ($_.days -match "Monday") } | `
               # Sort-Object "Time Start" | `
               # Format-Table "Time Start", "Time End", "Class Code"

# $ITSInstructors = $ClassDays | Where-Object { ($_."Class Code" -ilike "SYS*") -or `
                                              # ($_."Class Code" -ilike "NET*") -or `
                                              # ($_."Class Code" -ilike "SEC*") -or `
                                              # ($_."Class Code" -ilike "FOR*") -or `
                                              # ($_."Class Code" -ilike "CSI*") -or `
                                              # ($_."Class Code" -ilike "DAT*") } `
                              # | Select-Object "Instructor" `
                              # | Sort-Object "Instructor" -Unique
# $ITSInstructors

$ClassDays | Where { $_.Instructor -in $ITSInstructors.Instructor } `
           | Group-Object "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending