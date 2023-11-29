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
```
