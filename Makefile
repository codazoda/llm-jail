IMAGE ?= codex
.DEFAULT_GOAL := run

.PHONY: build run

build:
	docker build --tag $(IMAGE) .

run: build
	docker run -it --rm -e OPENAI_API_KEY $(IMAGE)
