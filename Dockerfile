FROM mcr.microsoft.com/devcontainers/base:bookworm

# Install minimal system dependencies
RUN apt-get --allow-releaseinfo-change update && \
    apt-get --yes install \
    python3-pip \
    python3-venv \
    git \
    cmake \
    gfortran \
    g++ \
    libhdf5-dev \
    mpich \
    wget 

# Set up Python environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

ARG NB_USER=ulb
ARG NB_UID=1000
ENV USER=${NB_USER}
ENV NB_UID=${NB_UID}
ENV HOME=/home/${NB_USER}


# Install Python packages
RUN pip install --upgrade pip && \
    pip install \
    numpy \
    scipy \
    matplotlib \
    pandas \
    jupyterlab

# Install OpenMC from source
RUN git clone --single-branch --branch develop --depth 1 https://github.com/openmc-dev/openmc.git && \
    cd openmc && \
    git fetch --tags && \
    git checkout v0.15.1 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install && \
    cd /openmc/ && \
    pip install .

RUN pip install \
    openmc_data_downloader \
    openmc_depletion_plotter \
    openmc_data

RUN mkdir -p ${HOME}/data

# Download nuclear data
# ENDFB-8.0
RUN cd ${HOME}/data && \
    wget -O nndc-b8.0.tar.xz https://anl.box.com/shared/static/uhbxlrx7hvxqw27psymfbhi7bx7s6u6a.xz && \
    mkdir nndc-b8.0-hdf5 && \
    tar -xf nndc-b8.0.tar.xz -C nndc-b8.0-hdf5

ENV OPENMC_CROSS_SECTIONS=${HOME}/data/nndc-b8.0-hdf5/endfb-viii.0-hdf5/cross_sections.xml

# Copy workshop files
COPY Datalabs/ ${HOME}/Datalabs/
COPY Extra/ ${HOME}/Extra/
COPY data/ ${HOME}/data/ 

WORKDIR ${HOME}

ENV PORT=8888

CMD ["jupyter", "lab", "--notebook-dir=/home/ulb/", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]