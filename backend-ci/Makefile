NAME = backend-ci
VERSION = 0.0.1
REPO = aerobatic/backend-ci

build:
	chmod 755 start-dynamodb.sh
	docker build --rm=false -t $(REPO):$(VERSION) .

interactive:
	docker run -i -t $(REPO):$(VERSION) bin/bash

tag_registry:
	docker tag $(REPO):$(VERSION) $(REGISTRY)/$(NAME):$(VERSION)

push:
	docker push $(REPO):$(VERSION)

release: tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)
	@echo "*** Don't forget to create a tag. git tag rel-$(VERSION) && git push origin rel-$(VERSION)"

clean_untagged:
	@docker rmi --force $$(docker images | grep '^<none>' | awk '{print $$3}')

clean_images:
	docker rmi $(NAME):latest $(NAME):$(VERSION) || true

login:
	docker login
