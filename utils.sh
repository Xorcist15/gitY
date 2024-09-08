#!/bin/bash

EDITOR="nvim"

function repo() {
    # Create a new public GitHub repository
    # Clone it 
    # Navigate into it
    # Open README.md with the editor
    gh repo create "$1" --public &&
    gh repo clone "$1" &&
    cd "$1" &&
    $EDITOR README.md
}

function del() {
    # Delete the specified GitHub repository
    gh repo delete "$1" --yes
}
