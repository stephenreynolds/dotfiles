all: install-brew install-fisher stow install-onedrive mkdirs

install-brew:
    brew bundle

install-fisher:
    #!/usr/bin/env fish
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

install-fzf-fish: install-fisher
    #!/usr/bin/env fish
    fisher install PatrickF1/fzf.fish

stow:
    stow . -t $HOME

install-onedrive:
    sudo rpm-ostree install ondrive --apply-live
    systemctl --user enable onedrive
