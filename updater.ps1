# Set the working directory to the script's location
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)

# Debugging: Confirm the current directory
Write-Host "Current working directory: $(Get-Location)"

# Define the path to the file to update
$filePath = ".\documentname.txt"

# Define random commit messages
$commitMessages = @(
    "Commit",
    "WIP",
    "WIP Part 2",
    "Bug fix",
    "Feature added",
    "Documentation update",
    "Refactor code",
    "Hotfix",
    "Performance improvement"
)

# Select a random commit message
$randomMessage = Get-Random -InputObject $commitMessages

# Update the document with a new entry (e.g., a timestamp)
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Add-Content -Path $filePath -Value "Update at $timestamp"

# Stage the changes using Git
git add $filePath

# Commit the changes with the random message
git commit -m $randomMessage

# Push the changes to the repository, suppressing unnecessary error output
git push origin main 2>$null


# Inform the user the script ran successfully
Write-Host "Updated $filePath and pushed changes with commit message: '$randomMessage'"
