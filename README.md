## Lua filters and Pandoc


GITLAB_TOKEN
as a Project Access Token with write_repository. The built-in CI_JOB_TOKEN can only read,
not push back to the repo.

``` bash
pandoc ${1%%.*}.org \
    --from=org --to=gfm \
    --output=${1%%.*}.md
    ```

# TexLive CI notes

scheme-full  ~4GB

In CI that 4GB gets downloaded and unpacked every run unless you cache the nix store. For your use case scheme-medium is the sweet spot \u2014 it covers everything pandoc + LuaLaTeX needs. scheme-full would only save time if you were constantly hitting missing packages from obscure CTAN packages, which you won't be with standard pandoc output.
