RELEASE := stable/2026.1
PY_VER := 3.13.12
DEST := /opt/openstack/neutron/
REPO := https://opendev.org/openstack/neutron.git
SRC := $(CURDIR)/src

build:
	git clone $(REPO) $(SRC) -b $(RELEASE)
	bash -xv ../utils/prepare.sh $(PY_VER) $(DEST)

install:
	$(DEST)/bin/pip install -c https://opendev.org/openstack/requirements/raw/branch/$(RELEASE)/upper-constraints.txt -r $(SRC)/requirements.txt $(SRC)
	$(DEST)/bin/pip install -c https://opendev.org/openstack/requirements/raw/branch/$(RELEASE)/upper-constraints.txt git+https://github.com/arnaudmorin/neutron-wireguard.git
	$(DEST)/bin/pip install git+https://github.com/arnaudmorin/oslo.messaging.git
	$(DEST)/bin/pip install blazingmq
	sed -i "s|^exec_dirs.*|exec_dirs=$(DEST)/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin,/etc/neutron/kill_scripts|g" $(DEST)/etc/neutron/rootwrap.conf

clean:
	rm -rf $(SRC)
	rm -rf $(CURDIR)/*.deb

.PHONY: install clean
