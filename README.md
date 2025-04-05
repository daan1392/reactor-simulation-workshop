# Reactor Simulation Workshop

Welcome to the Reactor Simulation Workshop! This hands-on tutorial introduces you to reactor physics simulations using Python and OpenMC. The workshop selects materials from two excellent resources: the [neutronics workshop](https://github.com/fusion-energy/neutronics-workshop.git) and the [Reactor Physics with Python](https://github.com/ezsolti/RFP.git) course from Uppsala University.

## Overview

This workshop is designed to:
- Provide a practical introduction to Python programming
- Teach fundamental reactor physics concepts
- Demonstrate how to calculate key reactor parameters and reactivity effects
- Give hands-on experience with open-source nuclear engineering tools

The workshop includes supplementary materials covering advanced topics such as:
- Building your own Monte Carlo particle transport simulator
- Understanding nuclear data formats and usage
- Additional reactor physics tutorials and examples

## Getting Started

To make this workshop accessible for everyone, we've simplified the setup process by providing a pre-configured Docker environment. This container includes:
- A complete OpenMC installation
- Pre-installed nuclear data libraries
- All required Python packages
- An organized folder structure for the workshop materials

# Local Installation

1. Install Docker for
[Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/),
[Mac OS](https://store.docker.com/editions/community/docker-ce-desktop-mac), or
[Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows). 

> [!IMPORTANT]
> Make sure you also install [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) if on Windows with
> ```wsl --install``` in PowerShell

> [!TIP]
> Verify the Docker installation
>To ensure Docker is installed correctly, open a terminal and run the following command:
>
>```docker --version```
>
>This should display the installed Docker version. If you encounter any issues, refer to the [Docker troubleshooting guide](https://docs.docker.com/get-docker/#troubleshoot-installation).


2. Clone the reactor-simulation-workshop using [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) or downloading the repository directly, make sure docker is running and build the docker image.

    ```git clone https://github.com/daan1392/reactor-simulation-workshop.git```

    <details>
    If you do not have git installed, or don't want to install it, you can also download the repository as a zip file and unzip it.
    </details>

    ```cd reactor-simulation-workshop```

    ```docker build -t reactor-workshop .```


3. Now that you have the docker image you can enable graphics linking between
your os and docker, and then run the docker container by typing the following
commands in a terminal window.

    ```docker run -p 8888:8888 reactor-workshop```

    <details>
      <summary><b>Expand</b> - Having permission denied errors?</summary>
        <pre><code class="language-html">
        If you are running the command from Linux or Ubuntu terminal and getting permission denied messages back.
        Try running the same command with elevated user permissions by adding sudo at the front.
        sudo docker run -p 8888:8888 ghcr.io/fusion-energy/neutronics-workshop
        Then enter your password when prompted.
        </code></pre>
    </details>

4. A URL should be displayed in the terminal and can now be opened in the
internet browser of your choice. Select and open the URL at the end of the terminal printout (highlighted below)

    ![Open the environment](docker-run.png)

If all went well you are now in a Jupyter Notebook environment. You will see the folders /data, /Datalabs and /extra. In Datalabs, the material used in the seminar is given and includes an introduction to Python, Sapling, Nuclear cross sections, Depletion, OpenMC basics and depletion. 