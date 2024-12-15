@echo off

:: Define the file path
set "filePath=C:\Users\user\OneDrive - Ulster University\Documents\powerShellRand\documentname.txt"

:: Change to the Git repository directory
cd "C:\Users\user\OneDrive - Ulster University\Documents\powerShellRand" || (
    echo Failed to change directory. Ensure the path is correct.
    pause
    exit /b 1
)

:: Generate a timestamp
for /f "tokens=*" %%A in ('powershell -NoProfile -Command "Get-Date -Format \"yyyy-MM-dd HH:mm:ss\""') do set "timestamp=%%A"
echo Generated timestamp: %timestamp%

:: Append timestamp to the document
echo Appending: Update at %timestamp%
echo Update at %timestamp% >> %filePath%

:: Display the file's contents for debugging
echo Current file contents:
type %filePath%

:: Debug Git staging
echo Staging changes...
git add -A
git status

:: Generate a random commit message
set commitMessages[0]=Commit
set commitMessages[1]=WIP
set commitMessages[2]=WIP Part 2
set commitMessages[3]=Bug fix
set commitMessages[4]=Feature added
set commitMessages[5]=Documentation update
set commitMessages[6]=Refactor code
set commitMessages[7]=Hotfix
set commitMessages[8]=Performance improvement

set /a count=9
set /a "index=%RANDOM% %% count"
for /f "tokens=*" %%A in ("%commitMessages[%index%]%") do set "randomMessage=%%A"
echo Random commit message: %randomMessage%

:: Commit the changes
git commit -m "%randomMessage%"

:: Push the changes
echo Pushing changes...
git push origin main

:: Pause for debugging
pause
