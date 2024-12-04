

Set-PSReadlineOption -EditMode vi -viModeIndicator Cursor
# Enabling Menu Completion 
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

#python env activation

if ($env:COMPUTERNAME -eq "Desktop-Azin") {
# cmu python env activation
    $Env:CONDA_EXE = "$Env:USERPROFILE\scoop\apps\anaconda3\current\App\Scripts\conda.exe"
    $Env:CONDA_ENV_EXE = "$Env:USERPROFILE\scoop\apps\anaconda3\current\App\Scripts\conda-env.exe"
    $Env:_CE_M = ""
    $Env:_CE_CONDA = ""
    $Env:_CONDA_ROOT = "$Env:USERPROFILE\scoop\apps\anaconda3\current\App"
    $Env:_CONDA_EXE = "$Env:USERPROFILE\scoop\apps\anaconda3\current\App\Scripts\conda.exe"
    $CondaModuleArgs = @{ChangePs1 = $True}
    Import-Module "$Env:_CONDA_ROOT\shell\condabin\Conda.psm1" -ArgumentList $CondaModuleArgs

    conda activate cmu-python

    Remove-Variable CondaModuleArgs
}

elseif ($env:COMPUTERNAME -eq "Desktop-Azin2") {
    # arcgis pro python env activation

    $Env:CONDA_EXE = "C:\Program Files\ArcGIS\Pro\bin\Python\Scripts\conda.exe"
    $Env:CONDA_ENV_EXE = "C:\Program Files\ArcGIS\Pro\bin\Python\Scripts\conda-env.exe"
    $Env:_CE_M = ""
    $Env:_CE_CONDA = ""
    $Env:_CONDA_ROOT = "C:\Program Files\ArcGIS\Pro\bin\Python"
    $Env:_CONDA_EXE = "C:\Program Files\ArcGIS\Pro\bin\Python\Scripts\conda.exe"
    $CondaModuleArgs = @{ChangePs1 = $True}
    Import-Module "$Env:_CONDA_ROOT\shell\condabin\Conda.psm1" -ArgumentList $CondaModuleArgs

    conda activate arcgispro-py3-clone

    Remove-Variable CondaModuleArgs
}

elseif ($env:COMPUTERNAME -eq "WS-Oakland-001") {
    # arcgis pro python env activation

    $Env:CONDA_EXE = "C:\Program Files\ArcGIS\Pro\bin\Python\Scripts\conda.exe"
    $Env:CONDA_ENV_EXE = "C:\Program Files\ArcGIS\Pro\bin\Python\Scripts\conda-env.exe"
    $Env:_CE_M = ""
    $Env:_CE_CONDA = ""
    $Env:_CONDA_ROOT = "C:\Program Files\ArcGIS\Pro\bin\Python"
    $Env:_CONDA_EXE = "C:\Program Files\ArcGIS\Pro\bin\Python\Scripts\conda.exe"
    $CondaModuleArgs = @{ChangePs1 = $True}
    Import-Module "$Env:_CONDA_ROOT\shell\condabin\Conda.psm1" -ArgumentList $CondaModuleArgs

    conda activate arcgispro-py3-clone

    Remove-Variable CondaModuleArgs
}

# # to open the last dir
# # Path to store the last directory
# $lastDirPath = "$HOME\last-dir.txt"
# # If the file exists, change to the directory stored in it
# if (Test-Path $lastDirPath) {
#     Set-Location (Get-Content $lastDirPath)
# }
# # Save the last directory on exit
# function Save-LastLocation {
#     $PWD.Path | Out-File -Encoding UTF8 -FilePath $lastDirPath
# }
# # Register the function to run when PowerShell exits
# Register-EngineEvent PowerShell.Exiting -Action { Save-LastLocation } | Out-Null
# #

# Does the rough equivalent of dir /s /b. For example, dirs *.png is dir /s /b *.png
function dirs {
    if ($args.Count -gt 0) {
        Get-ChildItem -Recurse -Include "$args" | Foreach-Object FullName
    } else {
        Get-ChildItem -Recurse | Foreach-Object FullName
    }
}

function clear-recyclebin {
Clear-RecycleBin -force
}

function reload-profile {
. $profile
}

function touch($file) {
    "" | Out-File $file -Encoding ASCII
}

function df {
    get-volume
}

function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}

function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

function pgrep($name) {
    Get-Process $name
}

Remove-Item -Path Alias:ls

function ls {exa --long --group-directories-first --icons --color=auto }
function ll {eza -l}
function la {eza -a}
function lt {eza --tree}

function e {exit}
function :q {exit}
function c {clear}

function fzfp {fzf --preview "cat {}"}
function fzfn {nvim $(fzf --preview "cat {}")}

function reboot {Restart-Computer}

function n {nvim}
function nvim-remove {Remove-Item -Path "$Env:USERPROFILE\AppData\Local\nvim-data" -Recurse -Force}

function lg {lazygit}

function ccd {chezmoi cd}
function cedit {chezmoi edit}
function cdiff {chezmoi diff}
function cstatus {chezmoi status}
function capply {chezmoi -v apply}

function ks {komorebic start --config "$Env:USERPROFILE\.config\komorebi\komorebi.json" --bar --ahk}
function ke {komorebic stop --bar}

$Env:XDG_CONFIG_HOME = "$Env:USERPROFILE\.config"

$Env:KOMOREBI_CONFIG_HOME = "$Env:USERPROFILE\.config\komorebi"
$Env:KOMOREBI_AHK_EXE = "$Env:USERPROFILE\AppData\Local\Programs\AutoHotkey\v2\AutoHotkey64.exe"

$Env:VISUAL = 'nvim'
$Env:EDITOR = 'nvim'
$Env:SHELL = 'pwsh'

$Env:PYENV = "$Env:USERPROFILE\.pyenv\pyenv-win\"
$Env:PYENV_HOME = "$Env:USERPROFILE\.pyenv\pyenv-win\"
$Env:PYENV_ROOT = "$Env:USERPROFILE\.pyenv\pyenv-win\"

$ENV:STARSHIP_CONFIG = "$Env:USERPROFILE\.config\starship\starship.toml"


if ($Env:COMPUTERNAME -eq "Desktop-Azin") {
    $ENV:YAZI_FILE_ONE = "$Env:USERPROFILE\scoop\apps\git\current\usr\bin\file.exe"
    $Env:NEOVIM_NODE_PATH = "C:\Program Files\nodejs\node.exe"
} elseif ($Env:COMPUTERNAME -eq "WS-Oakland-001") {
    $Env:YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"
    $Env:NEOVIM_NODE_PATH = "$USERPROFILE\scoop\apps\nodejs\current\node.exe"
}
$Env:YAZI_CONFIG_HOME = "$Env:USERPROFILE\.config\yazi" 

# shell_gpt config
 $Env:CHAT_CACHE_PATH = "$Env:USERPROFILE\AppData\Local\Temp\chat_cache"
 $Env:CACHE_PATH = "$Env:USERPROFILE\AppData\Local\Temp\cache"
 $Env:CHAT_CACHE_LENGTH = "100"
 $Env:CACHE_LENGTH = "100"
 $Env:REQUEST_TIMEOUT = "60"
 $Env:DEFAULT_MODEL = "gpt-4o"
 $Env:DEFAULT_COLOR = "magenta"
 $Env:ROLE_STORAGE_PATH = "$Env:USERPROFILE\.config\shell_gpt\roles"
 $Env:DEFAULT_EXECUTE_SHELL_CMD = "false"
 $Env:DISABLE_STREAMING = "false"
 $Env:CODE_THEME = "one-dark"
 $Env:OPENAI_FUNCTIONS_PATH = "$Env:USERPROFILE\.config\shell_gpt\functions"
 $Env:OPENAI_USE_FUNCTIONS = "true"
 $Env:SHOW_FUNCTIONS_OUTPUT = "false"
 $Env:API_BASE_URL = "default"
 $Env:PRETTIFY_MARKDOWN = "true"
 $Env:USE_LITELLM = "false"
 $Env:SHELL_INTERACTION = "true"
 $Env:OS_NAME = "auto"
 $Env:SHELL_NAME = "auto"

# $Env:Path = "$Env:USERPROFILE\scoop\apps\nodejs-lts\current;$Env:PATH"
$Env:Path += ";C:\msys64\mingw64\bin"
$Env:Path += ";$Env:USERPROFILE\.cargo\bin"
$Env:Path += ";$Env:USERPROFILE\scoop\shims"
$Env:Path += ";$Env:USERPROFILE\pipx\venvs\shell-gpt\Scripts"
$Env:Path += ";$Env:USERPROFILE\pipx\venvs\rich-cli\Scripts"
$Env:Path += ";$Env:USERPROFILE\temp_apps"
$Env:Path += ";$Env:USERPROFILE\temp_apps\yazi"

# using starship prompt
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })



