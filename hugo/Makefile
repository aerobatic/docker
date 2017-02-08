NAME = hugo
VERSION = 0.0.1
REPO = aerobatic/hugo

build:
	docker build --rm=false -t $(REPO):$(VERSION) .

interactive:
	docker run -i -t $(REPO):$(VERSION)

tag_registry:
	docker tag $(REPO):$(VERSION) $(REPO):$(VERSION)

# tag_latest:
#   docker tag $(REPO):$(VERSION) $(REPO):latest

push:
	docker push $(REPO):$(VERSION)

push_latest:
  docker push $(REPO):latest

tag_latest:
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)
	@echo "*** Don't forget to create a tag. git tag rel-$(VERSION) && git push origin rel-$(VERSION)"

clean_untagged:
	@docker rmi --force $$(docker images | grep '^<none>' | awk '{print $$3}')

clean_images:
	docker rmi $(NAME):latest $(NAME):$(VERSION) || true

login:
	docker login
