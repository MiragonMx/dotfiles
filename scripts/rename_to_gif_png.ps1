
Get-ChildItem *.png | Rename-Item -NewName {$_.Name -Replace '^', 'gif_'}

