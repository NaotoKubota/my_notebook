###############################################################
# Dockerfile to build container images for my notebook
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

CMD ["bash"]
