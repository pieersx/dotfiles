# Configuración Inicial de entorno
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\config.toml"
$ENV:STARSHIP_CACHE = "$HOME\AppData\Local\Temp"
$ENV:EDITOR = 'code'
$ENV:NODE_ENV = 'development'

# Configuración de Starship
Invoke-Expression (&starship init powershell)

# fnm Node.js
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

# Importar Módulos
Import-Module -Name PSReadLine
Import-Module -Name PSFzf
Import-Module -Name Terminal-Icons
Import-Module -Name CompletionPredictor
Import-Module -Name z

# Configuración de PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistoryNoDuplicates

# Configuración de PSFzf
Set-PsFzfOption `
  -PSReadlineChordProvider 'Ctrl+t' `
  -PSReadlineChordReverseHistory 'Ctrl+r' `
  -AltCCommand { param($Location) Set-Location $Location } `
  -EnableAliasEdit `
  -EnableAliasGitStatus `
  -EnableAliasKill `
  -EnableAliasZLocation

Set-PsFzfOption -TabExpansion

# Commpletado para winget
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
    [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
    $Local:word = $wordToComplete.Replace('"', '""')
    $Local:ast = $commandAst.ToString().Replace('"', '""')
    winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}

# Alias útiles para desarrolladores
function ll { ls -Force }
function gs { git status }
function gc { git commit }
function gp { git push }
function gl { git pull }

# Utilidades
function touch { New-Item -ItemType File -Name $args[0] }
function which { Get-Command -Name $args[0] -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path }

# Configuración de la terminal
Clear-Host
