## Lua filters and Pandoc


GITLAB_TOKEN
as a Project Access Token with write_repository. The built-in CI_JOB_TOKEN can only read,
not push back to the repo.

``` bash
pandoc ${1%%.*}.org \
    --from=org --to=gfm \
    --output=${1%%.*}.md
    ```
