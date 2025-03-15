###############################################################
# Dockerfile to build container images for my notebook (v1.6.3)
# Based on jupyter/scipy-notebook
###############################################################

FROM jupyter/scipy-notebook:notebook-6.4.12

USER root

# File Author / Maintainer
LABEL maintainer="Naoto Kubota <naotok@ucr.edu>"

ENV DEBIAN_FRONTEND=noninteractive

# Install plotly
RUN conda install "jupyterlab>=3" "ipywidgets>=7.6" && \
    conda install -c conda-forge -c plotly jupyter-dash

# Install pysam
RUN conda install -c bioconda pysam==0.21.0

# Install pybedtools
RUN conda install -c bioconda pybedtools==0.9.1

# Install Arial font
RUN apt update && \
    apt install -y msttcorefonts && \
    wget http://ftp.de.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.8_all.deb && \
    dpkg -i ttf-mscorefonts-installer_3.8_all.deb && \
    fc-cache -fv && \
    rm -rf ttf-mscorefonts-installer_3.8_all.deb

# Install pyCircos
RUN pip install python-circos

# Install UpsetPlot
RUN pip install upsetplot==0.9.0

# Install GSEApy
RUN pip install gseapy==1.1.5

# Install nbextensions
RUN conda install -c conda-forge jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --system && \
    jupyter nbextensions_configurator enable --system && \
    jupyter nbextension enable varInspector/main --system && \
    jupyter nbextension enable hinterland/hinterland --system && \
    jupyter nbextension enable toc2/main --system && \
    jupyter nbextension enable livemdpreview/livemdpreview --system && \
    jupyter nbextension enable collapsible_headings/main --system && \
    jupyter nbextension enable execute_time/ExecuteTime --system && \
    jupyter nbextension enable codefolding/main --system

# Install jupyterthemes
RUN conda install -c conda-forge jupyterthemes

# Change the default theme
RUN jt -t onedork -fs 125 -tfs 11 -nfs 115 -cellw 88% -T

# Remove font cache
RUN rm -rf /home/jovyan/.cache/matplotlib/fontlist-v330.json

CMD ["bash"]
