RELEASE := stable/2026.2
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
	$(DEST)/bin/pip install git+https://github.com/arnaudmorin/oslo.messaging.git@$(RELEASE)
	# NOTE(arnaud) BlazingMQ SDK with authentication and TLS, from the fork until it is released upstream
	$(DEST)/bin/pip install https://github.com/arnaudmorin/blazingmq-sdk-python/releases/download/v1.2.3-secure.cdec8fc/blazingmq-1.2.3-cp313-cp313-manylinux_2_28_x86_64.whl
	sed -i "s|^exec_dirs.*|exec_dirs=$(DEST)/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin,/etc/neutron/kill_scripts|g" $(DEST)/etc/neutron/rootwrap.conf

clean:
	rm -rf $(SRC)
	rm -rf $(CURDIR)/*.deb

.PHONY: install clean
