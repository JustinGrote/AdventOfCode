[int[]]$readings = Get-Content ./input

[int]$lastReading = $null

$readingIncreases = foreach ($reading in $readings) {
    if ($lastReading -and $reading -gt $lastReading) {
        $reading
    }
    $lastReading = $reading
}
$readingIncreases.count
