## dnf
see manual_packages_dnf.txt
install all with
```sh
chmod +x manual_packages_dnf.sh
yes | ./manual_packages_dnf.sh
```

also use something like this:
```sh
history | grep 'dnf install' >> dnf_inst_temp.txt
awk -i inplace '!seen[$0]++' dnf_inst_temp.txt
awk -i inplace 'sub(sudo dnf\s*/, "")' dnf_inst_temp.txt
sort dnf_inst_temp.txt > dnf_tmp_abc.txt
```
to get to a sorted list of recently installed
(or tried-to-installed) packages.
use dnf info [package] to see detailes on the packages

## copr
- starship (`copr enable atim/starship`)
- lazygit (`copr enable atim/lazygit`)
- wezterm (`copr enable wezfurlong/wezterm-nightly`)
- hyprland (`copr enable solopasha/hyprland`)
    + hyprland
    + hyprpicker
    + hyprpaper
    + hyprsunset
    + hypridle
    + hyprlock
- yazi (`copr enable lihaohong/yazi`)

## cargo
- presenterm
- ncspot
- du-dust
- wiki-tui
    + build error: cargo install --git https://github.com/Nanashi-lab/wiki-tui

## manual
- nwg-look (Gtk appearance modification)
- fira code nerd font (gnome font utility for installation)
- mutt-wizard (neomutt setup)
    + goimapnotify (notifications for mail - go compilation)

