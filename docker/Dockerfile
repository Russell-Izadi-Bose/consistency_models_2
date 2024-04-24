FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive PIP_PREFER_BINARY=1

# Install base utilities
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libgl1-mesa-dev libopenmpi-dev git wget \
    python3 python3-dev python3-pip python3-setuptools python3-wheel \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

RUN echo "export PATH=/usr/local/cuda/bin:$PATH" >> /etc/bash.bashrc \
    && echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> /etc/bash.bashrc

WORKDIR /home/

RUN conda install python=3.9
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/local/bin/pip
RUN pip install -q lightning gdown torchmetrics einops torchinfo --no-cache --upgrade
RUN pip install -q matplotlib torchvision wandb

# Install private dependencies
COPY docker/private.sh /private.sh
RUN chmod +x /private.sh
RUN /bin/bash /private.sh
