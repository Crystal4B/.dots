function Install-Dependencies {
    param (
        [string[]]$DependenciesToInstall
    )

    Write-Host "Installing dependencies..." -ForegroundColor Cyan

    foreach ($module in $DependenciesToInstall) {
        Install-Module $module
        Write-Host "$module installed successfully." -Foreground Green
    }

    Write-Host "Installing dependencies completed." -ForegroundColor Cyan
}

function Install-App {
    param (
        [string]$AppID
    )

    # Check if the app is already installed using winget
    $installedApp = winget list -q $AppID
    if ($installedApp) {
        Write-Host "$AppID is already installed." -ForegroundColor Green
    } else {
        # If not installed, install the app using winget
        Write-Host "Installing $AppID..." -ForegroundColor Yellow
        try {
            winget install $AppID -h | Out-Null
            Write-Host "$AppID installed successfully." -ForegroundColor Green
        } catch {
            Write-Host "Failed to install $AppID. Error: $_" -ForegroundColor Red
        }
    }
}

function Install-Apps {
    param (
        [string[]]$AppsToInstall
    )

    Write-Host "Starting installation..." -ForegroundColor Cyan

    foreach ($AppID in $AppsToInstall) {
        Install-App -AppID $appID
    }

    Write-Host "Installation completed." -ForegroundColor Cyan
}

function Set-Policies {
    param (
        [string[]]$PoliciesToSet
    )

    Write-Host "Setting up Policies..." -ForegroundColor Cyan

    foreach ($policy in $PoliciesToSet) {
        Set-ExecutionPolicy -ExecutionPolicy $policy -Scope CurrentUser
        Write-Host "$policy policy set successfully." -Foreground Green
    }

    Write-Host "Setting policies completed." -Foreground Cyan
}

function Link-Dotfiles {
    Write-Host "Setting up Dotfiles..." -ForegroundColor Cyan

    $sourceDir = Join-Path $PSScriptRoot "../dotfiles/windows/powershell"
    $profileDir = [System.IO.Path]::GetDirectoryName($PROFILE)

    if (-not (Test-Path $sourceDir)) {
        Write-Host "$sourceDir not found." -ForegroundColor Red
    }

    if (-not (Test-Path "$sourceDir/Profile.ps1")) {
        Write-Host "Profile.ps1 not found in $sourceDir." -ForegroundColor Red
    }

    if (-not (Test-Path $profileDir)) {
        Write-Host "Creating $profileDir..." -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $profileDir -Force
    }

    Copy-Item "$sourceDir/Profile.ps1" -Destination $PROFILE -Force
    Write-Host "Profile.ps1 copied successfully." -ForegroundColor Green

    Write-Host "Dotfiles setup completed." -ForegroundColor Cyan
}

Import-Module powershell-yaml

$dotfiles = Join-Path $PSScriptRoot "../dotfiles/windows"
$configYaml = Get-Content -Path "$dotfiles/dots.yaml" -Raw
$config = ConvertFrom-Yaml $configYaml

$dependencies = @(
    "powershell-yaml"
)

$policies = @(
    "RemoteSigned"
)

Install-Dependencies -DependenciesToInstall $dependencies
Install-Apps -AppsToInstall $config.installs
Set-Policies -PoliciesToSet $policies
Link-Dotfiles

