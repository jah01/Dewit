@echo off
set /p message="Enter the commit message: "
set /p confirm="Would you like to commit and push all changes with the following message: %message% (y/n)? ";
if "%confirm%"=="y" (
  git add .
  git commit -m "%message%"
  git push
  echo Staged, committed, and pushed changes!
) else (
  echo Process terminated.
)