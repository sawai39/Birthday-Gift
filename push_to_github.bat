@echo off
echo Adding remote repository... > git_push_output.txt
git remote add origin https://github.com/sawai39/Birthday-Gift >> git_push_output.txt 2>&1
echo. >> git_push_output.txt
echo Pushing to remote... >> git_push_output.txt
git push -u origin main >> git_push_output.txt 2>&1
echo. >> git_push_output.txt
echo Done! >> git_push_output.txt
echo Check git_push_output.txt for details.