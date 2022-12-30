# dotfiles

```
             .',;::::;,'.                stephen@Stephen-PC 
         .';:cccccccccccc:;,.            ------------------ 
      .;cccccccccccccccccccccc;.         OS: Fedora release 37 (Thirty Seven) x86_64 
    .:cccccccccccccccccccccccccc:.       Kernel: 6.0.15-300.fc37.x86_64 
  .;ccccccccccccc;.:dddl:.;ccccccc;.     Uptime: 13 hours, 51 mins 
 .:ccccccccccccc;OWMKOOXMWd;ccccccc:.    Packages: 2252 (rpm), 1 (flatpak) 
.:ccccccccccccc;KMMc;cc;xMMc:ccccccc:.   Shell: bash 5.2.9 
,cccccccccccccc;MMM.;cc;;WW::cccccccc,   Resolution: 1920x1080, 1920x1080, 1920x1080 
:cccccccccccccc;MMM.;cccccccccccccccc:   WM: awesome 
:ccccccc;oxOOOo;MMM0OOk.;cccccccccccc:   Theme: Adwaita-dark [GTK2/3] 
cccccc:0MMKxdd:;MMMkddc.;cccccccccccc;   Icons: Adwaita [GTK2/3] 
ccccc:XM0';cccc;MMM.;cccccccccccccccc'   Terminal: kitty 
ccccc;MMo;ccccc;MMW.;ccccccccccccccc;    CPU: Intel i7-7700K (8) @ 4.800GHz 
ccccc;0MNc.ccc.xMMd:ccccccccccccccc;     GPU: NVIDIA GeForce RTX 3070 Lite Hash Rate 
cccccc;dNMWXXXWM0::cccccccccccccc:,      Memory: 6120MiB / 32030MiB 
cccccccc;.:odl:.;cccccccccccccc:,.
:cccccccccccccccccccccccccccc:'.                                 
.:cccccccccccccccccccccc:;,..                                    
  '::cccccccccccccc::;,.
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
