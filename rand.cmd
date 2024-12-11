@echo off

:: Define the path to the file to update
set "filePath=C:\Users\user\OneDrive - Ulster University\Documents\powerShellRand\documentname.txt"

:: Change to the Git repository directory
cd "C:\Users\user\OneDrive - Ulster University\Documents\powerShellRand"

:: Define random commit messages
set commitMessages[0]=Commit
set commitMessages[1]=WIP
set commitMessages[2]=WIP Part 2
set commitMessages[3]=Bug fix
set commitMessages[4]=Feature added
set commitMessages[5]=Documentation update
set commitMessages[6]=Refactor code
set commitMessages[7]=Hotfix
set commitMessages[8]=Performance improvement

:: Get the number of commit messages
set /a count=9

:: Select a random commit message
set /a "index=%RANDOM% %% count"
for /f "tokens=*" %%A in ("%commitMessages[%index%]%") do set "randomMessage=%%A"

:: Update the document with a new entry (e.g., a timestamp)
for /f "tokens=*" %%A in ('powershell -NoProfile -Command "Get-Date -Format \"yyyy-MM-dd HH:mm:ss\""') do set "timestamp=%%A"
echo Update at %timestamp% >> %filePath%

:: Stage the changes using Git
git add -A

:: Commit the changes with the random message
git commit -m "%randomMessage%"

:: Push the changes to the repository, suppressing unnecessary error output
git push origin main 2>nul

:: Inform the user the script ran successfully
echo Updated %filePath% and pushed changes with commit message: '%randomMessage%'

