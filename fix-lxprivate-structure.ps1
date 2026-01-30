#!/usr/bin/env pwsh
# Fix lxprivate structure - move functions to docs/ for Jekyll
# Run this from C:\github\lxprivate

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  Fix lxprivate Structure for Jekyll" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$rootPath = Get-Location

# Check if we're in the right place
if (-not (Test-Path "wrangler.toml")) {
    Write-Host "ERROR: wrangler.toml not found. Are you in C:\github\lxprivate?" -ForegroundColor Red
    exit 1
}

Write-Host "Step 1: Creating docs directory structure..." -ForegroundColor Yellow
New-Item -ItemType Directory -Force -Path "docs\functions\api\results" | Out-Null
New-Item -ItemType Directory -Force -Path "docs\results" | Out-Null
Write-Host "  Created directories in docs/" -ForegroundColor Green

Write-Host ""
Write-Host "Step 2: Moving functions from doc/ to docs/..." -ForegroundColor Yellow

# Move functions
if (Test-Path "doc\functions\_middleware.ts") {
    Copy-Item "doc\functions\_middleware.ts" "docs\functions\" -Force
    Write-Host "  Moved _middleware.ts" -ForegroundColor Green
}

if (Test-Path "doc\functions\api\results.ts") {
    Copy-Item "doc\functions\api\results.ts" "docs\functions\api\" -Force
    Write-Host "  Moved results.ts" -ForegroundColor Green
}

if (Test-Path "doc\functions\api\results\[id].ts") {
    Copy-Item "doc\functions\api\results\[id].ts" "docs\functions\api\results\" -Force
    Write-Host "  Moved [id].ts" -ForegroundColor Green
}

# Move dashboard
if (Test-Path "doc\results\index.html") {
    Copy-Item "doc\results\index.html" "docs\results\" -Force
    Write-Host "  Moved dashboard index.html" -ForegroundColor Green
}

Write-Host ""
Write-Host "Step 3: Updating wrangler.toml..." -ForegroundColor Yellow

$wranglerContent = Get-Content "wrangler.toml" -Raw
$wranglerContent = $wranglerContent -replace 'pages_build_output_dir = "doc"', 'pages_build_output_dir = "docs/_site"'
$wranglerContent | Set-Content "wrangler.toml" -NoNewline

Write-Host "  Updated pages_build_output_dir to 'docs/_site'" -ForegroundColor Green

Write-Host ""
Write-Host "Step 4: Cleaning up old doc/ directory..." -ForegroundColor Yellow

# Remove old doc/functions directory if it exists
if (Test-Path "doc\functions") {
    Remove-Item "doc\functions" -Recurse -Force
    Write-Host "  Removed doc/functions/" -ForegroundColor Green
}

# Remove old doc/results directory if it exists
if (Test-Path "doc\results") {
    Remove-Item "doc\results" -Recurse -Force
    Write-Host "  Removed doc/results/" -ForegroundColor Green
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  Structure Fixed!" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "New structure:" -ForegroundColor White
Write-Host "  docs/" -ForegroundColor Gray
Write-Host "    functions/          <- API functions" -ForegroundColor Gray
Write-Host "    results/            <- Dashboard" -ForegroundColor Gray
Write-Host "    _site/              <- Jekyll output (includes functions)" -ForegroundColor Gray
Write-Host ""
Write-Host "wrangler.toml now points to: docs/_site" -ForegroundColor Gray
Write-Host ""
Write-Host "================================================================" -ForegroundColor Yellow
Write-Host "  Next: Commit and Push" -ForegroundColor Yellow
Write-Host "================================================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "git add ." -ForegroundColor Gray
Write-Host "git commit -m 'Move functions to docs/ for Jekyll build'" -ForegroundColor Gray
Write-Host "git push origin main" -ForegroundColor Gray
Write-Host ""
