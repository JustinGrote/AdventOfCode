$data = Get-Content ./input
function GetMostCommonValues($data, [switch]$LeastCommon) {
    $zero = [int[]]::new(12)
    $one = [int[]]::new(12)
    foreach ($row in $data) {
        for ($i = 0; $i -lt $zero.length; $i++) {
            [int][string]$row[$i] -eq 0 ? $zero[$i]++ : $one[$i]++ | Out-Null
        }
    }

    for ($i = 0; $i -lt $zero.length; $i++) {
        if ($leastCommon) {
            [char]($zero[$i] -gt $one[$i] ? '1' : '0')
        } else {
            [char]($zero[$i] -gt $one[$i] ? '0' : '1')
        }
    }
}

$gammaRate = [Convert]::ToInt32(((GetMostCommonValues $data) -join ''), 2)
$epsilonRate = [Convert]::ToInt32(((GetMostCommonValues $data -LeastCommon) -join ''), 2)

$gammaRate * $epsilonRate
