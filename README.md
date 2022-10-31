# dotfiles

```
         -/oyddmdhs+:.                stephen@Stephen-PC 
     -odNMMMMMMMMNNmhy+-`             ------------------ 
   -yNMMMMMMMMMMMNNNmmdhy+-           OS: Gentoo Linux x86_64 
 `omMMMMMMMMMMMMNmdmmmmddhhy/`        Kernel: 5.15.74-gentoo 
 omMMMMMMMMMMMNhhyyyohmdddhhhdo`      Uptime: 42 mins 
.ydMMMMMMMMMMdhs++so/smdddhhhhdm+`    Packages: 754 (emerge) 
 oyhdmNMMMMMMMNdyooydmddddhhhhyhNd.   Shell: fish 3.4.0 
  :oyhhdNNMMMMMMMNNNmmdddhhhhhyymMh   Resolution: 1920x1080, 1920x1080, 1920x1080 
    .:+sydNMMMMMNNNmmmdddhhhhhhmMmy   WM: awesome 
       /mMMMMMMNNNmmmdddhhhhhmMNhs:   Theme: Adwaita-dark [GTK2/3] 
    `oNMMMMMMMNNNmmmddddhhdmMNhs+`    Icons: Adwaita [GTK2/3] 
  `sNMMMMMMMMNNNmmmdddddmNMmhs/.      Terminal: kitty 
 /NMMMMMMMMNNNNmmmdddmNMNdso:`        CPU: Intel i7-7700K (8) @ 4.800GHz 
+MMMMMMMNNNNNmmmmdmNMNdso/-           GPU: NVIDIA GeForce RTX 3070 Lite Hash Rate 
yMMNNNNNNNmmmmmNNMmhs+/-`             Memory: 2457MiB / 32046MiB 
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
git clone --bare https://github.com/stephenreynolds/dotfiles.git $HOME/.dotfiles

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
