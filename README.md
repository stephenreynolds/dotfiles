# dotfiles

```
                   -`                    stephen@vmlinuz 
                  .o+`                   --------------- 
                 `ooo/                   OS: Arch Linux x86_64 
                `+oooo:                  Host: VMware20,1 None 
               `+oooooo:                 Kernel: 6.2.9-arch1-1 
               -+oooooo+:                Uptime: 5 hours, 22 mins 
             `/:-:++oooo+:               Packages: 902 (pacman), 7 (flatpak) 
            `/++++/+++++++:              Shell: zsh 5.9 
           `/++++++++++++++:             Resolution: 1920x1080, 1920x1080, 1920x1080 
          `/+++ooooooooooooo/`           DE: GNOME 43.4 
         ./ooosssso++osssssso+`          WM: awesome 
        .oossssso-````/ossssss+`         Theme: Adwaita [GTK2/3] 
       -osssssso.      :ssssssso.        Icons: Adwaita [GTK2/3] 
      :osssssss/        osssso+++.       Terminal: kitty 
     /ossssssss/        +ssssooo/-       CPU: Intel i7-7700K (8) @ 4.200GHz 
   `/ossssso+/:-        -:/+osssso+-     GPU: 00:0f.0 VMware SVGA II Adapter 
  `+sso+:-`                 `.-/+oso:    Memory: 2869MiB / 15996MiB 
 `++:.                           `-/+/
 .`                                 `/                           
```

## Install on a new system

```bash
# Create an alias for git to use when working with the repo
echo 'alias dots="git --git-dir $HOME/.dotfiles --work-tree=$HOME"' >> $HOME/.zshrc

# Reload so the new alias can be used
exec zsh

# Clone the dotfiles repo
git clone --bare --recurse-submodules https://github.com/stephenreynolds/dotfiles.git $HOME/.dotfiles

# Checkout the repo
dots checkout

# Prevent untracked files from showing in dotfiles status
dots config --local status.showUntrackedFiles no
```

## Updating

Use the `dots` alias to update the repository.

### Add/Update

`dots add .zshrc`

### Add all modified without new files

`dots add -u`

### Commit

`dots commit -m "Add .zshrc`

### Push

`dots push`
