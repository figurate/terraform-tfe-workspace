SHELL:=/bin/bash
include .env

.PHONY: all clean test docs format

all: test docs format

clean:
	rm -rf .terraform/

test:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/github init && $(TERRAFORM) -chdir=modules/github validate && \
		$(TERRAFORM) -chdir=modules/github init && $(TERRAFORM) -chdir=modules/bedrock validate

docs:
	docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./ >./README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/github >./modules/github/README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/bedrock >./modules/bedrock/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/github && \
		$(TERRAFORM) fmt -list=true ./modules/bedrock
