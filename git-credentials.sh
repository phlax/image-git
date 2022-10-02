#!/bin/bash -e


# Token auth
if [[ -e ~/git/.git-credentials ]]; then
    cat ~/git/.git-credentials > ~/.git-credentials
fi
if [[ -e ~/git/.gitconfig ]]; then
    cat ~/git/.gitconfig > ~/.gitconfig
fi

mkdir -p ~/.ssh

# SSH auth
if [[ -e ~/ssh/id_rsa ]]; then
    cat ~/ssh/id_rsa > ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
fi
if [[ -e ~/ssh/id_rsa.pub ]]; then
    cat ~/ssh/id_rsa.pub > ~/.ssh/id_rsa.pub
fi
if [[ -e ~/ssh/known_hosts ]]; then
    cat ~/ssh/known_hosts > ~/.ssh/known_hosts
fi
if [[ -e ~/.ssh/id_rsa ]] && [[ ! -e ~/.ssh/known_hosts  ]]; then
    # TODO: figure out a better way to do this
    ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
fi
