
Get-ChildItem *.png | Rename-Item -NewName {$_.Name -Replace '^0*', ''}

