[int]$horizontal = 0
[int]$depth = 0

function forward ($distance) {
    $SCRIPT:horizontal += $distance
}
function down ($distance) {
    $SCRIPT:depth += $distance
}
function up ($distance) {
    $SCRIPT:depth -= $distance
}

Get-Content input | ForEach-Object {
    Invoke-Expression $_
}
Write-Output ($horizontal * $depth)
