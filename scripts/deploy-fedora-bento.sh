#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "========================================================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers

# https://github.com/chef/bento/tree/master/packer_templates/fedora
# https://app.vagrantup.com/bento/boxes/fedora-33

vagrant box add  "bento/fedora-33" --provider=virtualbox
vagrant mutate "bento/fedora-33"  libvirt

vagrant init --template Vagrantfile.provision.bash.erb
# must be created in project root directory with Vagrantfile template file
vagrant up --provider=libvirt "vg-fedora-01"

vagrant box list #veridy installed boxes
virsh list --all #show all running KVM/libvirt VMs



echo "========================================================================================="
