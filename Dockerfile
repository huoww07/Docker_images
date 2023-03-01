FROM continuumio/miniconda
LABEL Author="Wenwen" Description="Docker image containing biopython and samtools"


RUN apt-get --allow-releaseinfo-change update && apt install -y procps g++ && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

COPY samtools.yml /

RUN conda env create -f /samtools.yml && conda clean -a
RUN /bin/bash -c "source activate samtools"

ENV PATH /opt/conda/envs/samtools/bin:$PATH
