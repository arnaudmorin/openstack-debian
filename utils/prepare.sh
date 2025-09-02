#!/bin/bash
# Download and Compile Python from sources

PY_VER=$1
PY_PATH=$2
PY_VER_M="${PY_VER%.*}"  # Remove patch version (3.11.9 --> 3.11)

# Install deps
apt-get install -fy make \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  wget \
  curl \
  clang \
  llvm \
  libncurses5-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  liblzma-dev \
  tk-dev

# Download python
cd /tmp/
wget -q "https://www.python.org/ftp/python/${PY_VER}/Python-${PY_VER}.tgz"
tar xzf "Python-${PY_VER}.tgz"
cd "Python-${PY_VER}"

# Compile at right place
mkdir -p "${PY_PATH}"
./configure \
  --prefix="${PY_PATH}/" \
  --enable-shared \
  --enable-optimizations \
  --with-lto \
  LDFLAGS=-Wl,-rpath="${PY_PATH}/lib",--disable-new-dtags
make -j "$(nproc)"
make install

# Upgrade base python stuff
${PY_PATH}/bin/python${PY_VER_M} -m pip install --upgrade pip setuptools wheel

# Add some symlinks
ln -sf ${PY_PATH}/bin/python${PY_VER_M}        ${PY_PATH}/bin/python3
ln -sf ${PY_PATH}/bin/python${PY_VER_M}        ${PY_PATH}/bin/python
ln -sf ${PY_PATH}/bin/pip${PY_VER_M}           ${PY_PATH}/bin/pip3
ln -sf ${PY_PATH}/bin/pip${PY_VER_M}           ${PY_PATH}/bin/pip
ln -sf ${PY_PATH}/bin/pydoc${PY_VER_M}         ${PY_PATH}/bin/pydoc
ln -sf ${PY_PATH}/bin/idle${PY_VER_M}          ${PY_PATH}/bin/idle
ln -sf ${PY_PATH}/bin/python${PY_VER_M}-config ${PY_PATH}/bin/python-config
