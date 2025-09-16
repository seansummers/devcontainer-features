# Dev Container Features

This repository contains a _collection_ of Features for Dev Containers.

### `tenv`

Running `tenv` inside the built container will manage OpenTofu / Terraform / Terragrunt / Terramate and Atmos versions.

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/seansummers/devcontainer-features/tenv:1": {}
    }
}
```

## Repo and Feature Structure

Similar to the [`devcontainers/features`](https://github.com/devcontainers/features) repo, this repository has a `src` folder.  Each Feature has its own sub-folder, containing at least a `devcontainer-feature.json` and an entrypoint script `install.sh`. 

```
├── src
│   ├── tenv
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
|   ├── ...
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
...
```
