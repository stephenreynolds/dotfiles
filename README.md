# dotfiles

```
             .',;::::;,'.                stephen@toolbox 
         .';:cccccccccccc:;,.            --------------- 
      .;cccccccccccccccccccccc;.         OS: Fedora Linux 37 (Container Image) x86_64 
    .:cccccccccccccccccccccccccc:.       Kernel: 6.0.17-300.fc37.x86_64 
  .;ccccccccccccc;.:dddl:.;ccccccc;.     Uptime: 5 hours, 23 mins 
 .:ccccccccccccc;OWMKOOXMWd;ccccccc:.    Packages: 941 (rpm) 
.:ccccccccccccc;KMMc;cc;xMMc:ccccccc:.   Shell: zsh 5.9 
,cccccccccccccc;MMM.;cc;;WW::cccccccc,   Resolution: 1920x1080, 1920x1080, 1920x1080 
:cccccccccccccc;MMM.;cccccccccccccccc:   DE: GNOME 43.2 
:ccccccc;oxOOOo;MMM0OOk.;cccccccccccc:   WM: Mutter 
cccccc:0MMKxdd:;MMMkddc.;cccccccccccc;   WM Theme: Adwaita 
ccccc:XM0';cccc;MMM.;cccccccccccccccc'   Theme: adw-gtk3-dark [GTK2/3] 
ccccc;MMo;ccccc;MMW.;ccccccccccccccc;    Icons: Adwaita [GTK2/3] 
ccccc;0MNc.ccc.xMMd:ccccccccccccccc;     Terminal: conmon 
cccccc;dNMWXXXWM0::cccccccccccccc:,      CPU: Intel i7-7700K (8) @ 4.800GHz 
cccccccc;.:odl:.;cccccccccccccc:,.       GPU: NVIDIA GeForce RTX 3070 Lite Hash Rate 
:cccccccccccccccccccccccccccc:'.         Memory: 4720MiB / 32030MiB 
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
