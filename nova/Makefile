VENV := /opt/openstack/nova/
REPO := https://opendev.org/openstack/nova.git
RELEASE := stable/2024.2
SRC := $(CURDIR)/src

build:
	git clone $(REPO) $(SRC) -b $(RELEASE)

install:
	python3 -m venv $(VENV)
	# Workaround for nova-rootwrap because this is not configurable from config
	sed -i "s|sudo nova-rootwrap|sudo $(VENV)/bin/nova-rootwrap|" $(SRC)/nova/utils.py
	$(VENV)/bin/pip install -c https://opendev.org/openstack/requirements/raw/branch/$(RELEASE)/upper-constraints.txt -r $(SRC)/requirements.txt $(SRC)
	$(VENV)/bin/pip install -c https://opendev.org/openstack/requirements/raw/branch/$(RELEASE)/upper-constraints.txt libvirt-python
	sed -i "s|^exec_dirs.*|exec_dirs=$(VENV)/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin,/etc/neutron/kill_scripts|g" $(VENV)/etc/nova/rootwrap.conf

clean:
	rm -rf $(SRC)

.PHONY: install clean

