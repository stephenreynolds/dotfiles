# dotfiles

```
         -/oyddmdhs+:.                stephen@gentoo 
     -odNMMMMMMMMNNmhy+-`             -------------- 
   -yNMMMMMMMMMMMNNNmmdhy+-           OS: Gentoo Linux x86_64 
 `omMMMMMMMMMMMMNmdmmmmddhhy/`        Kernel: 5.15.72-gentoo-dist 
 omMMMMMMMMMMMNhhyyyohmdddhhhdo`      Uptime: 8 hours, 52 mins 
.ydMMMMMMMMMMdhs++so/smdddhhhhdm+`    Packages: 876 (emerge) 
 oyhdmNMMMMMMMNdyooydmddddhhhhyhNd.   Shell: zsh 5.9 
  :oyhhdNNMMMMMMMNNNmmdddhhhhhyymMh   Resolution: 1920x1080, 1920x1080, 1920x1080 
    .:+sydNMMMMMNNNmmmdddhhhhhhmMmy   WM: awesome 
       /mMMMMMMNNNmmmdddhhhhhmMNhs:   Theme: Adwaita-dark [GTK2/3] 
    `oNMMMMMMMNNNmmmddddhhdmMNhs+`    Icons: Adwaita [GTK2/3] 
  `sNMMMMMMMMNNNmmmdddddmNMmhs/.      Terminal: kitty 
 /NMMMMMMMMNNNNmmmdddmNMNdso:`        CPU: Intel i7-7700K (8) @ 4.800GHz 
+MMMMMMMNNNNNmmmmdmNMNdso/-           GPU: NVIDIA GeForce RTX 3070 Lite Hash Rate 
yMMNNNNNNNmmmmmNNMmhs+/-`             Memory: 3229MiB / 32041MiB 
/hMMNNNNNNNNMNdhs++/-`
`/ohdmmddhys+++/:.`                                           
  `-//////:--.                                                
```

## Install on a new system

```bash
# Create an alias for git to use when working with the repo
echo 'alias dotfiles="git --git-dir $HOME/.dotfiles --work-tree=$HOME"' >> $HOME/.zshrc

# Reload so the new alias can be used
exec zsh

# Clone the dotfiles repo
git clone --bare https://github.com/stephenreynolds/dotfiles.git $HOME/.dotfiles

# Checkout the repo
dotfiles checkout

# Prevent untracked files from showing in dotfiles status
dotfiles config --local status.showUntrackedFiles no
```

## Updating

Use the `dotfiles` alias to update the repository.

### Add/Update

`dotfiles add .zshrc`

### Add all modified without new files

`dotfiles add -u`

### Commit

`dotfiles commit -m "Add .zshrc`

### Push

`dotfiles push`
