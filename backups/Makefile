include env_make
NS ?= snapgizmos
VERSION ?= latest

REPO = backups
NAME = backup-scheduler
INSTANCE = default

.PHONY: build push shell run start stop rm release

build:
		docker build -t $(NS)/$(REPO):$(VERSION) .

push:
		docker push $(NS)/$(REPO):$(VERSION)

shell:
		docker run --rm --name $(NAME)-$(INSTANCE) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION) /bin/bash

run:
		docker run --rm --name $(NAME)-$(INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION)

start:
		docker run -d --name $(NAME)-$(INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION)

stop:
		docker stop $(NAME)-$(INSTANCE)

rm:
		docker rm $(NAME)-$(INSTANCE)

oc:
		mkdir -p tmp
		cd tmp && wget -qO- -cnd https://github.com/openshift/origin/releases/download/v1.4.0-rc1/openshift-origin-client-tools-v1.4.0-rc1.b4e0954-linux-64bit.tar.gz | tar xzf -
		for f in $(shell find tmp/* -maxdepth 0 -type d) ; do \
			cp $$f/oc bin/; \
			rm -rf tmp; \
		done;

release: build
		make push -e VERSION=$(VERSION)

default: build
