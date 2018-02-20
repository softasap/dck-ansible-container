include ../../make/Makefile

pre-build:
	@echo do some stuff before the docker build

post-build:
	@echo do some stuff after the docker build
	docker tag $(IMAGE):$(VERSIONPREFIX).$(VERSION) container-conductor-$(ANSIBLE_CONTAINER_IMAGE_DISTRO)-$(ANSIBLE_CONTAINER_IMAGE_DISTRO_TAG):$(ANSIBLE_CONTAINER_VERSION) ;
