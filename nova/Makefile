VENV := $(DESTDIR)/opt/openstack/nova/
REPO := https://opendev.org/openstack/nova.git
RELEASE := stable/2024.2
SRC := $(CURDIR)/src

build:
	git clone $(REPO) $(SRC) -b $(RELEASE)

install:
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install -c https://opendev.org/openstack/requirements/raw/branch/$(RELEASE)/upper-constraints.txt -r $(SRC)/requirements.txt $(SRC)

clean:
	rm -rf $(SRC)

.PHONY: install clean

