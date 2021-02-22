How to install node packages in nix:

 1. Write the packages that you want at `node-pacages.json`
 2. Generate the required `*.nix` files running
    ```bash
    nix-shell
    ```
 3. Actually install your node-packages. We have 3 options:
  
  - Manually install your package (for example kind), use:
    ```bash
    nix-env -f default.nix -iA kind
    ```
  - Add it into your `~/.config/nixpkgs/home.nix` config (home-manager is required):
    ```nix
    let node-packages = import ./node-packages/default.nix { };
    in {
      ...

      home.packages = [ 
	 
	...
	node-packages.kind-lang 
	...

	];
      ...
    }
    ```
  - Add it into your etc/nixos/configuration.nix
    ```nix
    let node-packages = import ./node-packages/default.nix { };
    in {
      ...
                                                            
      environment.systemPackages = [ 
     
      ...
      node-packages.kind-lang 
      ...
                                                            
      ];
      ...
    }
    ```
