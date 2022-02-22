FROM "snakemake/snakemake:main"
RUN /bin/sh -c "pip install azure-storage-blob"
RUN /bin/sh -c "apt-get update -y && apt-get upgrade -y"
RUN /bin/sh -c "apt-get install -y \
    dirmngr \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    gnupg2"
RUN /bin/sh -c "apt-key adv \
    --keyserver keyserver.ubuntu.com \
    --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7'"
RUN /bin/sh -c "add-apt-repository \
    'deb https://cloud.r-project.org/bin/linux/debian \
    $(lsb_release -cs)-cran40/'"
RUN /bin/sh -c "apt-get update -y && apt-get upgrade -y"
RUN /bin/sh -c "apt-get -y install r-base"
