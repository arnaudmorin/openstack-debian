RELEASE := stable/2024.2
PY_VER := 3.11.9
DEST := /opt/openstack/neutron/
REPO := https://opendev.org/openstack/neutron.git
SRC := $(CURDIR)/src

build:
	git clone $(REPO) $(SRC) -b $(RELEASE)
	bash -xv ../utils/prepare.sh $(PY_VER) $(DEST)

install:
	$(DEST)/bin/pip install -c https://opendev.org/openstack/requirements/raw/branch/$(RELEASE)/upper-constraints.txt -r $(SRC)/requirements.txt $(SRC)
	sed -i "s|^exec_dirs.*|exec_dirs=$(DEST)/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin,/etc/neutron/kill_scripts|g" $(DEST)/etc/neutron/rootwrap.conf

clean:
	rm -rf $(SRC)

.PHONY: install clean
