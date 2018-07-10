FROM rocker/rstudio

LABEL maintainer="Stefano Ghignone, IPSP-CNR, Turin, Italy, stefano.ghignone[at]ipsp.cnr.it"
LABEL version="dev."
LABEL description=""

RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get install -y --no-install-recommends zlib1g-dev libxml2-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'source("http://bioconductor.org/biocLite.R")' -e 'biocLite("DESeq2")'
