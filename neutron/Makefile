VENV := /opt/openstack/neutron/
REPO := https://opendev.org/openstack/neutron.git
RELEASE := stable/2024.2
SRC := $(CURDIR)/src

build:
	git clone $(REPO) $(SRC) -b $(RELEASE)

install:
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install -c https://opendev.org/openstack/requirements/raw/branch/$(RELEASE)/upper-constraints.txt -r $(SRC)/requirements.txt $(SRC)
	sed -i "s|^exec_dirs.*|exec_dirs=$(VENV)/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin,/etc/neutron/kill_scripts|g" $(VENV)/etc/neutron/rootwrap.conf
	for file in `ls $(SRC)/etc/oslo-config-generator/*`; do \
	    $(VENV)/bin/oslo-config-generator --config-file=$$file \
	done

clean:
	rm -rf $(SRC)

.PHONY: install clean

