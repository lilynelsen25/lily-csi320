# Lists every process that does NOT include the string "system32"

Get_Process | Sort-Object {$_.name -notin "system32"}