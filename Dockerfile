# Build: docker build --tag codex .
# Run:   docker run -it --rm -e OPENAI_API_KEY codex

FROM alpine:latest

# Install git, Node.js, and npm; then install codex globally
RUN apk add --no-cache git nodejs npm curl \
    && npm install -g @openai/codex \
    && npm cache clean --force

# Start in the home directory (~)
WORKDIR /root

# Friendly interactive prompt (red "codex" and short hostname)
ENV PS1="\e[31mcodex\e[0m [\w] # "

CMD ["sh"]
