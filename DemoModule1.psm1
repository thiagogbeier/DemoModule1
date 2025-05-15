# demomodule.psm1

$functionPath = Join-Path $PSScriptRoot 'Functions'
Get-ChildItem -Path $functionPath -Filter '*.ps1' | ForEach-Object {
    . $_.FullName
}
