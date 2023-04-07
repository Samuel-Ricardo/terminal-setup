#VAR

$NVIM_CONFIG = 'C:\Users\Desktop\AppData\Local\nvim'


#---SETUP---#

#setup - [oh-my-posh]

 oh-my-posh init pwsh | Invoke-Expression

 #Import-Module posh-git
 #Import-Module oh-my-posh
 Set-PoshPrompt clean-detailed   #your_theme

#setup - [auto-complete] 
 
 #AzPredictor
 Enable-AzPredictor

 #PSReadLine
 #Import-Module PSReadLine
 Set-PSReadLineOption -PredictionSource HistoryAndPlugin
 Set-PSReadLineOption -PredictionViewStyle ListView
 Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
 
 #Set-PSReadLineOption -EditMode Emacs
 #Set-PSReadLineOption -BellStyle None

 #Fzf
 Import-Module PSFzf
 Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r' 
 

# Setup - [Icons]
Import-Module -Name Terminal-Icons


# Alias
#
#Set-Alias vim nvim
#Set-Alias ll ls

Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:/Program Files/Git/usr/bin/tig.exe'
Set-Alias less 'C:/Program Files/Git/usr/bin/less.exe'





# Utilities

function wich ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}






