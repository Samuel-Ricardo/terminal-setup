
# oh-my-posh init pwsh | Invoke-Expression    # init
# Set-PoshPrompt clean-detailed               # your_theme

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/night-owl.omp.json" | Invoke-Expression

### TERMINAL ICONS

Import-Module -Name Terminal-Icons

# Get-Item ./README.md

# Get-ChildItem

# Get-ChildItem | Format-List

# Get-ChildItem | Format-Wide

###

### CODE* SUGGESTION / AUTOCOMPLETE

Enable-AzPredictor

# LIST VIEW SUGGESTIONS

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView

###

### FUZZY FINDER

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

###


#clear && ls
