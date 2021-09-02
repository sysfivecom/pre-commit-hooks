# sysfive.com Checks

Checks that are not yet released elsewhere:

- git-crypt-check

  Check usage of git-crypt in a repo

  Forked from a gist by Sebastien Varrette https://gist.github.com/Falkor/848c82daa63710b6c132bb42029b30ef

## Usage

Add to your `.pre-commit-config.yaml`:

    - repo: https://github.com/sysfivecom/pre-commit-hooks
      rev: 0.1.0
      hooks:
        - id: git-crypt-check
