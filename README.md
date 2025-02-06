```
# build / activate
`nix run #.activate`

# format all
`nix fmt`

# test all
`nix run nixpkgs#nixci`

# build rpi image
nix build .#rpi

# update
nix flake update

# partial update
nix flake lock --update-input nixpkgs --update-input darwin --update-input home-manager
(or? nix run .#update)

# find why package is installed
nix why-depends /run/current-system nixpkgs#curl

# re-create private sops key
nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt"

# create a server sops key (to be added to .sops.yaml)
nix-shell -p ssh-to-age --run 'ssh-keyscan example.com | ssh-to-age'

# edit secrets
sops secrets/example.yaml
```
