install-brew:
    brew bundle

install-fisher:
    #!/usr/bin/env fish
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

install-fzf-fish: install-fisher
    #!/usr/bin/env fish
    fisher install PatrickF1/fzf.fish

install-cargo:
    #!/usr/bin/env fish
    curl https://sh.rustup.rs -sSf | sh
    rustup default

stow:
    stow . -t $HOME

install-onedrive:
    mkdir -p $HOME/.onedrive/{Documents,Music,Pictures,Videos}
    ln -sf $HOME/.onedrive/Documents $HOME/
    ln -sf $HOME/.onedrive/Pictures $HOME/
    ln -sf $HOME/.onedrive/Music $HOME/
    ln -sf $HOME/.onedrive/Videos $HOME/
    sudo rpm-ostree install onedrive --apply-live
    systemctl --user enable onedrive

mkdirs:
    mkdir -p $HOME/src/{archive,cloned,repos,sandbox,work}

docker:
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
