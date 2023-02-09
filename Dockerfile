###############################################################
# Dockerfile to build container images for my notebook
# Based on jupyter/scipy-notebook
###############################################################

FROM jupyter/scipy-notebook:notebook-6.4.12

# File Author / Maintainer
LABEL maintainer="Naoto Kubota <naotok@ucr.edu>"

ENV DEBIAN_FRONTEND=noninteractive

# install plotly
RUN conda install "jupyterlab>=3" "ipywidgets>=7.6" && \
    conda install -c conda-forge -c plotly jupyter-dash

# install MetBrewer
RUN git clone https://github.com/BlakeRMills/MetBrewer.git && \
    cd MetBrewer/Python/ && \
    python setup.py install
