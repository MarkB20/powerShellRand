# Define the path to the file that will be updated
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
    "Performance improvement",
    "Initial commit"
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

# Push the changes to the repository
git push origin main

# Inform the user the script ran successfully
Write-Host "Updated $filePath and pushed changes with commit message: '$randomMessage'"
