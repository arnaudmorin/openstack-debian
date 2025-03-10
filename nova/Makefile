# Variables
VENV := ${DESTDIR}/opt/openstack/nova/
REPO := https://opendev.org/openstack/nova.git

# Cibles
all: 
	$(eval TMP := $(shell mktemp -d))
	@mkdir $(TMP)/src
	python3 -m venv $(VENV)
	git clone $(REPO) $(TMP)/src
	$(VENV)/bin/pip install -c https://opendev.org/openstack/requirements/raw/branch/stable/2024.2/upper-constraints.txt -r $(TMP)/src/requirements.txt $(TMP)/src
	rm -rf $(TMP)

clean:
	rm -rf $(VENV)

.PHONY: all clean

