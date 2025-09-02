RELEASE := stable/2024.2
PY_VER := 3.11.9
DEST := /opt/openstack/nova/
REPO := https://opendev.org/openstack/nova.git
SRC := $(CURDIR)/src

build:
	git clone $(REPO) $(SRC) -b $(RELEASE)
	bash -xv ../utils/prepare.sh $(PY_VER) $(DEST)

install:
	# Workaround for nova-rootwrap because this is not configurable from config
	sed -i "s|sudo nova-rootwrap|sudo $(DEST)/bin/nova-rootwrap|" $(SRC)/nova/utils.py
	$(DEST)/bin/pip install -c https://opendev.org/openstack/requirements/raw/branch/$(RELEASE)/upper-constraints.txt -r $(SRC)/requirements.txt $(SRC)
	$(DEST)/bin/pip install -c https://opendev.org/openstack/requirements/raw/branch/$(RELEASE)/upper-constraints.txt libvirt-python
	sed -i "s|^exec_dirs.*|exec_dirs=$(DEST)/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin,/etc/neutron/kill_scripts|g" $(DEST)/etc/nova/rootwrap.conf

clean:
	rm -rf $(SRC)

.PHONY: install clean

