# dotfiles

```
                   -`                    stephen@archie
                  .o+`                   --------------
                 `ooo/                   OS: Arch Linux x86_64
                `+oooo:                  Kernel: 6.2.9-arch1-1
               `+oooooo:                 Uptime: 2 hours, 35 mins
               -+oooooo+:                Packages: 816 (pacman), 4 (flatpak)
             `/:-:++oooo+:               Shell: zsh 5.9
            `/++++/+++++++:              Resolution: 1920x1080
           `/++++++++++++++:             DE: Hyprland
          `/+++ooooooooooooo/`           Theme: Adw-dark [GTK2/3]
         ./ooosssso++osssssso+`          Icons: Adwaita [GTK2/3]
        .oossssso-````/ossssss+`         Terminal: kitty
       -osssssso.      :ssssssso.        CPU: Intel i7-7700K (8) @ 4.800GHz
      :osssssss/        osssso+++.       GPU: NVIDIA GeForce RTX 3070 Lite Hash Rate
     /ossssssss/        +ssssooo/-       Memory: 4716MiB / 32032MiB
   `/ossssso+/:-        -:/+osssso+-
  `+sso+:-`                 `.-/+oso:
 `++:.                           `-/+/
 .`                                 `/
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
