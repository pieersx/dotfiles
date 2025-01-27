# Configuración de Starship
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\config.toml"
$ENV:STARSHIP_CACHE = "$HOME\AppData\Local\Temp"
Invoke-Expression (&starship init powershell)

# Importa módulos
Import-Module -Name Posh-Git
Import-Module -Name Terminal-Icons
Import-Module PSReadLine

# Configuración de Oh My Posh
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\the-unnamed.omp.json" | Invoke-Expression

# Configuración de PSReadLine
Set-PSReadLineOption -Colors @{ InlinePrediction = '#8a8a8a' }
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -EditMode Emacs

# Enable-TransientPrompt

# Alias útiles para desarrolladores
function ll { ls -Force }
function gs { git status }
function gc { git commit }
function gp { git push }

# Estilo de la terminal (colores y fuentes)
$host.UI.RawUI.BackgroundColor = "Black"
$host.UI.RawUI.ForegroundColor = "White"
Clear-Host

# Mensaje de bienvenida
# Write-Host "👨‍💻 Bienvenido a tu terminal, desarrollador!" -ForegroundColor Cyan
