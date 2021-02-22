How to install node packages in nix:

 1. Write the packages thet you want at `node-pacages.json`
 2. Generate the required `*.nix` files running
    ```bash
    nix-shell
    ```
 3. To install your package (for example kind), use:
    ```bash
    nix-env -f default.nix -iA kind
    ```
