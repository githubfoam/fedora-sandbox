
deploy-centos:
	bash scripts/deploy-centos.sh

deploy-fedora-bento:
	bash scripts/deploy-fedora-bento.sh

deploy-fedora:
	bash scripts/deploy-fedora.sh

deploy-libvirt:
	bash scripts/deploy-libvirt.sh

deploy-vagrant:
	bash scripts/deploy-vagrant.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-vagrant deploy-libvirt 
