# Reactor simulation workshop
The idea for this workshop comes from the neutronics workshop https://github.com/fusion-energy/neutronics-workshop.git.

A selection of resources for learning nuclear reactor simulations with a
particular focus on [OpenMC](https://openmc.org/) combining 

There is a [slide](https://fusion-energy.github.io/neutronics-workshop-slides/index.html) deck that introduces the workshop and each task.

There is also a [Gather Town](https://gather.town/app/QnHxhg6bPf8KQdii/openmc-workshop) space which is great for working through the workshop with colleagues.

These examples require specific versions of software packages and nuclear data to run correctly.
Therefore **I highly recommend making use of the containerized environment** to run these example notebooks.

The repository has benefited greatly from user feedback. Please feel free to
raise GitHub [issues](https://github.com/fusion-energy/neutronics-workshop/issues)
or reach out in the [discussions](https://github.com/fusion-energy/neutronics-workshop/discussions)
section if you spot anything that needs fixing or think of an improvement.
Pull requests are very welcome.

The video below gives a brief explainer of what to expect in the workshop and some motivation for learning neutronics.

<p align="center"><a href="https://youtu.be/HH-poTG-FxM" target="_blank"><img src="https://user-images.githubusercontent.com/8583900/144746742-3e31e0ee-6380-4db7-b8ea-0b1c302d497b.png" height="400" /></a></p>


| Tasks | Keywords | Video(s) | CI test status|
|-|-|-|-|
| [Task 1 - Cross sections](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_01_cross_sections) | Nuclear data, cross-sections, MT numbers, Doppler | [link1](https://youtu.be/eBZ2lY_2v7I)  [link2](https://youtu.be/ELZNeIdSuMY) [link3](https://youtu.be/ec5BLLL6Q_g) [link4](https://youtu.be/mkl1mVnTO6g) |[![Task 1](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_1.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_1.yml)|
| [Task 2 - Materials](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_02_making_materials) | Materials, Neutronics Material Maker, Mixed materials | [link](https://youtu.be/-NGnY-1TWCA) | [![Task 2](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_2.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_2.yml) |
| [Task 3 - CSG geometry](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_03_making_CSG_geometry) | CSG geometry, Geometry visualisation | [link](https://youtu.be/Ovr7oYukYRw) | [![Task 3](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_3.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_3.yml) |
| [Task 4 - Sources](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_04_make_sources) | Neutron point sources, Gamma sources, Plasma sources, Neutron track visualization | [link](https://youtu.be/j9dT1Viqcu4) | [![Task 4](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_4.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_4.yml) |
| [Task 5 - TBR](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_05_CSG_cell_tally_TBR) | Tritium Breeding Ratio, Cell tallies, Simulations | [link](https://youtu.be/Vc7Qy7QW4o8) | [![Task 5](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_5.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_5.yml) |
| [Task 6 - DPA](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_06_CSG_cell_tally_DPA) | Displacements Per Atom, Cell tallies, Simulations, Volume calculations | [link](https://youtu.be/VLn59FSc4GA) | [![Task 6](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_6.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_6.yml) |
| [Task 7 - Neutron and photon spectra](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_07_CSG_cell_tally_spectra) | Neutron Spectra, Photon Spectra, Cell tallies, Energy group structures, Flux, Current | [link](https://youtu.be/qHqAuqMLYPA) | [![Task 7](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_7.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_7.yml) |
| [Task 8 - Mesh tallies](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_08_CSG_mesh_tally) | Mesh tallies, Structured meshes | [link](https://youtu.be/KYIsDjip1nQ) |[![Task 8](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_8.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_8.yml)|
| [Task 9 - Instantaneous Dose](https://github.com/fusion-energy/neutronics-workshop/tree/reshuffle/tasks/task_09_CSG_instantaneous_dose_tallies) | Instantaneous Dose, Cell tallies, Dose coefficients |  |[![Task 9](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_9.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_9.yml)|
| [Task 10 - Activation transmutation depletion](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_10_activation_transmutation_depletion) | Isotope build up and tally variation as a function of time |  |[![Task 10](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_10.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_10.yml)|
| [Task 11 - CSG shut down Dose](https://github.com/fusion-energy/neutronics-workshop/tree/reshuffle/tasks/task_11_CSG_shut_down_dose_tallies) | Shut down Dose, Cell tallies, Dose coefficients |  |[![Task 11](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_11.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_11.yml)|
| [Task 12 - Detector examples](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_12_detector_examples) | Time filter detector response time of flight |  |[![Task 12](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_12.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_12.yml)|
| [Task 13 - stochastic volume calculation](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_13_stochastic_volume_calculation) | stochastic volume material atoms in cell |  |[![Task 13](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_13.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_13.yml)|
| [Task 14 - Variance_reduction](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_14_variance_reduction) | Variance reduction, weight windows |  |[![Task 14](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_14.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_14.yml)|
| [Task 15 - Making CAD geometry](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_15_making_CAD_geometry) | Parametric CAD geometry, Paramak, Geometry visualisation | [link](https://www.youtube.com/watch?v=Bn_TcJSOvaA) |[![Task 15](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_15.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_15.yml)|
| [Task 16 - CAD Cell tallies](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_16_CAD_cell_tally_heat) | CAD-based neutronics, Cell tallies, DAGMC, Heating |  |[![Task 16](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_16.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_16.yml)|
| [Task 17 - CAD Mesh tallies](https://github.com/fusion-energy/neutronics-workshop/tree/main/tasks/task_17_CAD_mesh_fast_flux) | CAD-based neutronics, Mesh tallies, Paramak, DAGMC, Fast flux |  |[![Task 17](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_17.yml/badge.svg?branch=main)](https://github.com/fusion-energy/neutronics-workshop/actions/workflows/ci_task_17.yml)|


# Local Installation

There are video tutorials for this section which accompany the step by step
instructions below.
- Ubuntu installation video :point_right: <p align="center"><a href="https://youtu.be/qJLmt_dAaC0" target="_blank"><img src="https://user-images.githubusercontent.com/8583900/114008054-c9cb7e80-9859-11eb-8e07-32e95c600667.png" height="70" /></a></p>
- Windows installation video :point_right: <p align="center"><a href="https://youtu.be/1MUYgjEQeIA" target="_blank"><img src="https://user-images.githubusercontent.com/8583900/114008108-d3ed7d00-9859-11eb-8bb5-0c19ce775015.png" height="70" /></a></p>
- Mac installation video :point_right: <p align="center"><a href="https://youtu.be/jUMY-cEILcw" target="_blank"><img src="https://user-images.githubusercontent.com/8583900/114172031-05834880-992d-11eb-8277-5a6cda2b5e12.png" height="70" /></a></p>

1. Install Docker CE for
[Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/),
[Mac OS](https://store.docker.com/editions/community/docker-ce-desktop-mac), or
[Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows),
including the part where you enable docker use as a non-root user. 

2. Pull the docker image from the store by typing the following command in a
terminal window, or Windows users might prefer PowerShell.

    ```docker pull ghcr.io/fusion-energy/neutronics-workshop```

    <details>
      <summary><b>Expand</b> - Having permission denied errors?</summary>
        <pre><code class="language-html">
        If you are running the command from Linux or Ubuntu terminal and getting permission denied messages back.
        Try running the same command with with elevated user permissions by adding sudo at the front.
        sudo docker pull ghcr.io/fusion-energy/neutronics-workshop
        Then enter your password when prompted.
        </code></pre>
    </details>

3. Now that you have the docker image you can enable graphics linking between
your os and docker, and then run the docker container by typing the following
commands in a terminal window.

    ```docker run -p 8888:8888 ghcr.io/fusion-energy/neutronics-workshop```

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

<p align="center"><img src="https://user-images.githubusercontent.com/8583900/144759522-5306e61e-e30d-45e0-bb1a-ea8360e8c6da.png" width="70%" /></p>

To check the tasks run try opening the first task in the half day workshop folder and running the Jupyter Lab code (either click on the triangular run button or click on the first code cell and press shift and enter to execute that cell).