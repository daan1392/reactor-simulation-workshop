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
# RUN openmc_data_downloader -d ${HOME}/data -l ENDFB-8.0-NNDC -p neutron -i H1 H2 H3 O16 U235 U236 U237 U238 Pu239 Pu240 Pu241 Pu242 -e Zr
# RUN download_endf_chain -d ${HOME}/data -r b8.0

# ENDFB-8.0
RUN cd ${HOME}/data && \
    wget -O nndc-b8.0.tar.xz https://anl.box.com/shared/static/uhbxlrx7hvxqw27psymfbhi7bx7s6u6a.xz && \
    mkdir nndc-b8.0-hdf5 && \
    tar -xf nndc-b8.0.tar.xz -C nndc-b8.0-hdf5

ENV OPENMC_CROSS_SECTIONS=${HOME}/data/nndc-b8.0-hdf5/endfb-viii.0-hdf5/cross_sections.xml

# JEFF-3.3
# RUN cd ${HOME}/data && \
#     wget -O nea_jeff33.tar.xz https://anl.box.com/shared/static/ddetxzp0gv1buk1ev67b8ynik7f268hw.xz && \
#     mkdir nea_jeff33 && \
#     tar -xf nea_jeff33.tar.xz -C nea_jeff33 && \
#     rm nea_jeff33.tar.xz

# ENV OPENMC_CROSS_SECTIONS=${HOME}/data/nea_jeff33/jeff-3.3-hdf5/cross_sections.xml 

# ENV OPENMC_CROSS_SECTIONS=${HOME}/data/cross_sections.xml

# Create Datalab directory structure
RUN mkdir -p ${HOME}/Datalabs/01_Introduction_to_Python \
    ${HOME}/Datalabs/02_Intermediate_Python \
    ${HOME}/Datalabs/03_Intermediate2_Python \
    ${HOME}/Datalabs/04_MC_Intro \
    ${HOME}/Datalabs/06_OpenMC_Intro \
    ${HOME}/Datalabs/11_OpenMC_Depletion 

# Create Additional directory structure
RUN mkdir -p ${HOME}/Extra/04_Scattering \
    ${HOME}/Extra/05_DIY_MC_Transport \
    ${HOME}/Extra/08_Reactor_Kinetics \
    ${HOME}/Extra/09_Subcritical_Systems \
    ${HOME}/Extra/10_OpenMC_Scripting \
    ${HOME}/Extra/11_OpenMC_depletion

# Copy workshop files
COPY Datalabs/ ${HOME}/Datalabs/
COPY Extra/ ${HOME}/Extra/
COPY data/ ${HOME}/data/ 

WORKDIR ${HOME}

ENV PORT=8888

CMD ["jupyter", "lab", "--notebook-dir=/home/ulb/", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]