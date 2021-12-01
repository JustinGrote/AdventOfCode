using namespace System.Collections.Generic
[int[]]$readings = Get-Content ./input

#We use a rolling series of lists to meet the requirement
[List[List[int]]]$rollingMeasures = @()

$readingIncreases = foreach ($reading in $readings) {
    $rollingMeasures.Add([List[int]]::new())
    foreach ($rollingMeasureList in $rollingMeasures) {
        if ($rollingMeasureList.Count -ge 3) {continue}
        $rollingMeasureList.Add($reading)
    }
    if ($rollingMeasures[0].count -eq 3 -and $rollingMeasures[1].count -eq 3) {
        [int]$total1, [int]$total2 = foreach ($i in 0..1) {
            ($rollingMeasures[$i] | Measure-Object -Sum).Sum
        }
        if ($total2 -gt $total1) {
            Write-Output $total2
        }
        $rollingMeasures.RemoveAt(0)
    }
}
$readingIncreases.count
