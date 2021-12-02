[int]$GLOBAL:horizontal = 0
[int]$GLOBAL:depth = 0
[int]$GLOBAL:aim = 0

function forward ($distance) {
    $GLOBAL:horizontal += $distance
    $GLOBAL:depth += $distance * $GLOBAL:aim
}
function down ($distance) {
    $GLOBAL:aim += $distance
}
function up ($distance) {
    $GLOBAL:aim -= $distance
}

Get-Content $PSScriptRoot/input | ForEach-Object {
    Invoke-Expression $_
}
Write-Output ($horizontal * $depth)
