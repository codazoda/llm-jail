# LLM Jail

This Docker container isolates the command-line interface (CLI) of your large language model (LLM), such as Codex, Gemini, or Claude.

The container runs Alpine Linux and includes `git`, `curl` and `codex`. You can checkout a git repo into a temp directory and run your favorite CLI in that directory. The idea is that the LLM is less likely to blow up your machine because it's in this docker container. The container serves as the sandbox.

Quick start (Make):

- Default: `make` (builds image then runs container)
- Explicit: `make build` and `make run` (passes through host `OPENAI_API_KEY`)

Alternative (raw Docker):

- Build: `docker build --tag codex .`
- Run (passes through host OPENAI_API_KEY): `docker run -it --rm -e OPENAI_API_KEY codex`

Notes:

- Ensure `OPENAI_API_KEY` is set in your host shell before running. Using `-e OPENAI_API_KEY` without a value tells Docker to propagate the host variable into the container.
- You can override the image name with `IMAGE=my-tag make build` and `IMAGE=my-tag make run`.
- The container sets a custom colored prompt via `PS1` to `codex (abcd) [\w] #` where `abcd` are the first 4 characters of the container hostname (typically the container ID), with "codex" in red.
