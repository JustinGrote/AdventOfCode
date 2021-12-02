
# These tests are not meant to be run individually but sequentially
Describe 'Functions' {
    BeforeAll {
        . $PSScriptRoot/Part2.ps1
    }
    It 'forward 5' {
        forward 5
        $GLOBAL:horizontal | Should -Be 5
        $GLOBAL:aim | Should -Be 0
    }
    It 'down 5' {
        down 5
        $GLOBAL:aim | Should -Be 5
    }
    It 'forward 8' {
        forward 8
        $GLOBAL:aim | Should -Be 5
        $GLOBAL:horizontal | Should -Be 13
        $GLOBAL:depth | Should -Be 40
    }
    It 'up 3' {
        up 3
        $GLOBAL:aim | Should -Be 2
        $GLOBAL:horizontal | Should -Be 13
        $GLOBAL:depth | Should -Be 40
    }
    It 'down 8' {
        down 8
        $GLOBAL:aim | Should -Be 10
        $GLOBAL:horizontal | Should -Be 13
        $GLOBAL:depth | Should -Be 40
    }
    It 'forward 2' {
        forward 2
        $GLOBAL:aim | Should -Be 10
        $GLOBAL:horizontal | Should -Be 15
        $GLOBAL:depth | Should -Be 60
    }
}
