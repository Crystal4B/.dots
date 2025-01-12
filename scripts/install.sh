#!/bin/bash

#Install Nix packages manager
echo "Installing Nix in multi-user mode..."
sh <(curl -L https://nixos.org/nix/install) --daemon

EXTRA_FEATURES=(
    --extra-experimental-features nix-command
    --extra-experimental-features flakes
)

echo "Activating configuration..."
nix run ~/.dots#homeConfigurations.msek.activationPackage "${EXTRA_FEATURES}"

echo "Setup complete. Configuration is now active"

