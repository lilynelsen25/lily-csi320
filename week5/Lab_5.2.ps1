function gatherClasses(){

$page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.19/Courses.html

# Get all the tr elements of HTML document
$trs=$page.ParsedHtml.body.getElementsByTagName("tr")

# Empty array to hold results.
$FullTable = @()
for($i=1; $i -lt $trs.length; $i++){

    # Get every td element of current tr element.
    $tds = $trs[$i].getElementsByTagName("td")

    # Want to separate start time and end time from one end field.
    $Times = $tds[5].innerText.split("-")

    $FullTable += [psCustomObject]@{"Class Code" = $tds[0].innerText; `
                                    "Title" = $tds[1].innerText; `
                                    "Days" = $tds[4].innerText; `
                                    "Time Start" = $Times[0]; `
                                    "Time End" = $Times[1]; `
                                    "Instructor" = $tds[6].innerText; `
                                    "Location" = $tds[9].innerText; `
                                }
} # end of for loop.
return $FullTable
}

function daysTranslator($FullTable){

#Go over every record in the table
for($i=0; $i -lt $FullTable.length; $i++){

    $Days = @()

    if($FullTable[$i].Days -ilike "*M*"){ $Days += "Monday" }
    if($FullTable[$i].Days -ilike "*T[T,W,F]*"){ $Days += "Tuesday" }
    if($FullTable[$i].Days -ilike "*W*"){ $Days += "Wednesday" }
    if($FullTable[$i].Days -ilike "*TH*"){ $Days += "Thursday" }
    if($FullTable[$i].Days -ilike "*F*"){ $Days += "Friday" }

    $FullTable[$i].Days = $Days
}

return $FullTable
}