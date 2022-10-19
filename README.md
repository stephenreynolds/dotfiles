# dotfiles

## Install on a new system

```bash
# Create an alias for git to use when working with the repo
echo 'alias dotfiles="git --git-dir $HOME/.dotfiles --work-tree=/"' >> $HOME/.zshrc

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
