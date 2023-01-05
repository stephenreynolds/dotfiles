# dotfiles

```
         -/oyddmdhs+:.                stephen@Stephen-PC 
     -odNMMMMMMMMNNmhy+-`             ------------------ 
   -yNMMMMMMMMMMMNNNmmdhy+-           OS: Gentoo Linux x86_64 
 `omMMMMMMMMMMMMNmdmmmmddhhy/`        Kernel: 5.15.85-gentoo-dist 
 omMMMMMMMMMMMNhhyyyohmdddhhhdo`      Uptime: 11 mins 
.ydMMMMMMMMMMdhs++so/smdddhhhhdm+`    Packages: 864 (emerge), 10 (flatpak) 
 oyhdmNMMMMMMMNdyooydmddddhhhhyhNd.   Shell: zsh 5.9 
  :oyhhdNNMMMMMMMNNNmmdddhhhhhyymMh   WM: awesome 
    .:+sydNMMMMMNNNmmmdddhhhhhhmMmy   Theme: Adwaita-dark [GTK2/3] 
       /mMMMMMMNNNmmmdddhhhhhmMNhs:   Icons: Adwaita [GTK2/3] 
    `oNMMMMMMMNNNmmmddddhhdmMNhs+`    Terminal: kitty 
  `sNMMMMMMMMNNNmmmdddddmNMmhs/.      CPU: Intel i7-7700K (8) @ 4.500GHz 
 /NMMMMMMMMNNNNmmmdddmNMNdso:`        GPU: NVIDIA GeForce RTX 3070 Lite Hash Rate 
+MMMMMMMNNNNNmmmmdmNMNdso/-           Memory: 1658MiB / 32042MiB 
yMMNNNNNNNmmmmmNNMmhs+/-`
/hMMNNNNNNNNMNdhs++/-`                                        
`/ohdmmddhys+++/:.`                                           
  `-//////:--.
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
