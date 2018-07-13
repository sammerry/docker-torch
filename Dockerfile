FROM nvidia/cuda:9.2-devel-ubuntu16.04

# TODO: remove any un-used dependencies
RUN apt-get update && apt-get install -y \
  git \
  software-properties-common \
  graphviz \
  libssl-dev \
  libzmq3-dev \
  python3 \
  python3-pip \
  build-essential \
  checkinstall \
  libreadline-gplv2-dev \
  libncursesw5-dev \
  libssl-dev \
  libsqlite3-dev \
  tk-dev \
  libgdbm-dev \
  libc6-dev \
  libbz2-dev \
  wget \
  sudo

RUN pip3 install --upgrade pip
RUN pip install \
  jupyter \

ENV TORCH_NVCC_FLAGS="-D__CUDA_NO_HALF_OPERATORS__"
RUN git clone https://github.com/torch/distro.git /torch --recursive && \
  cd /torch && bash install-deps && ./install.sh -b

RUN git clone https://github.com/torch/demos.git /demos --recursive

ADD ./entrypoint.sh /entrypoint.sh

WORKDIR /demos

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/torch/install/bin/th"]

