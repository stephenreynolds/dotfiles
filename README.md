# dotfiles

```
            .-/+oossssoo+\-.               stephen@Stephen-PC
        ´:+ssssssssssssssssss+:`           ------------------
      -+ssssssssssssssssssyyssss+-         OS: Ubuntu 22.04.3 LTS on Windows 10.0.22621 x86_64
    .ossssssssssssssssssdMMMNysssso.       Kernel: 5.15.90.1-microsoft-standard-WSL2
   /ssssssssssshdmmNNmmyNMMMMhssssss\      Uptime: 2 hours, 2 mins
  +ssssssssshmydMMMMMMMNddddyssssssss+     Packages: 417 (dpkg), 422 (nix-user), 48 (nix-default), 5 (snap)
 /sssssssshNMMMyhhyyyyhmNMMMNhssssssss\    Shell: fish 3.6.1
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Terminal: Windows Terminal
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   CPU: Intel i7-7700K (8) @ 4.199GHz
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   GPU: Microsoft Corporation Basic Render Driver
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   Memory: 859MiB / 15963MiB
+sssshhhyNMMNyssssssssssssyNMMMysssssss+
.ssssssssdMMMNhsssssssssshNMMMdssssssss.
 \sssssssshNMMMyhhyyyyhdNMMMNhssssssss/
  +sssssssssdmydMMMMMMMMddddyssssssss+
   \ssssssssssshdmNNNNmyNMMMMhssssss/
    .ossssssssssssssssssdMMMNysssso.
      -+sssssssssssssssssyyyssss+-
        `:+ssssssssssssssssss+:`
            .-\+oossssoo+/-.
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
