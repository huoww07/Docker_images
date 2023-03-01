FROM continuumio/miniconda
LABEL Author="huoww07" Description="Docker image containing biopython and samtools"

COPY samtools.yml /

RUN conda env create -f /samtools.yml && conda clean -a
RUN /bin/bash -c "source activate samtools"

ENV PATH /opt/conda/envs/samtools/bin:$PATH
