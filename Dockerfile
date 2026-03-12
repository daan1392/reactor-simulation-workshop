FROM mcr.microsoft.com/devcontainers/base:bookworm

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-pip \
    python3-venv \
    git \
    cmake \
    gfortran \
    g++ \
    libhdf5-dev \
    mpich \
    wget \
    ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up environment variables
ARG NB_USER=vscode
ARG NB_UID=1000
ENV USER=${NB_USER} \
    HOME=/home/vscode \
    VIRTUAL_ENV=/opt/venv
    
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Create virtual environment and install core Python tools
RUN python3 -m venv $VIRTUAL_ENV && \
    pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir ipykernel jupyterlab

# Install Scientific Python Stack
RUN pip install --no-cache-dir \
    numpy \
    scipy \
    matplotlib \
    pandas \
    lxml \
    h5py

# Install OpenMC from source (v0.15.3)
RUN git clone --single-branch --branch develop --depth 1 https://github.com/openmc-dev/openmc.git && \
    cd openmc && \
    git fetch --tags && \
    git checkout v0.15.3 && \
    mkdir build && cd build && \
    cmake .. && \
    make -j$(nproc) && \
    make install && \
    cd .. && \
    pip install .

# Install OpenMC community tools
RUN pip install --no-cache-dir \
    openmc_data_downloader \
    openmc_depletion_plotter \
    openmc_data

# Register the Kernel for Jupyter/Codespaces
RUN python3 -m ipykernel install --name "openmc" --display-name "Python (OpenMC)"

# Prepare workspace and copy files
WORKDIR ${HOME}
COPY --chown=${NB_UID}:${NB_UID} Datalabs/ ${HOME}/Datalabs/
COPY --chown=${NB_UID}:${NB_UID} Extra/ ${HOME}/Extra/
COPY --chown=${NB_UID}:${NB_UID} data/ ${HOME}/data/

# Ensure the user owns the virtual environment and home dir
RUN chown -R ${NB_UID}:${NB_UID} /opt/venv ${HOME}

USER ${NB_USER}
ENV PORT=8888
EXPOSE 8888

# Default command if run locally; Codespaces will override this
CMD ["jupyter", "lab", "--notebook-dir=/home/vscode/", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
