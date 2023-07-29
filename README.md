# dotfiles

`                   -`                    stephen@archie
                  .o+`                   --------------
                 `ooo/                   OS: Arch Linux x86_64
                `+oooo:                  Kernel: 6.4.6-arch1-1
               `+oooooo:                 Uptime: 2 hours, 8 mins
               -+oooooo+:                Packages: 1145 (pacman)
             `/:-:++oooo+:               Shell: fish 3.6.1
            `/++++/+++++++:              Resolution: 1920x1080
           `/++++++++++++++:             DE: Hyprland
          `/+++ooooooooooooo/`           WM: sway
         ./ooosssso++osssssso+`          Theme: adw-gtk3-dark [GTK2/3]
        .oossssso-````/ossssss+`         Icons: Adwaita [GTK2/3]
       -osssssso.      :ssssssso.        Terminal: kitty
      :osssssss/        osssso+++.       CPU: Intel i7-7700K (8) @ 4.500GHz
     /ossssssss/        +ssssooo/-       GPU: NVIDIA GeForce RTX 3070 Lite Hash Rate
   `/ossssso+/:-        -:/+osssso+-     Memory: 7437MiB / 32033MiB
  `+sso+:-`                 `.-/+oso:
 `++:.                           `-/+/
 .`                                 `/                           ``
```

## Install on a new system

```bash
# Create an alias for git to use when working with the repo
alias dots="git --git-dir $HOME/.dotfiles --work-tree=$HOME"

# Clone the dotfiles repo
git clone --bare https://github.com/stephenreynolds/dotfiles.git $HOME/.dotfiles

# Checkout the repo
dots checkout -f

# Clone submodules
dots submodule update --init --recursive

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

`dots commit -m "Add .zshrc"`

### Push

`dots push`
