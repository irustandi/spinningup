FROM nvcr.io/nvidia/pytorch:20.01-py3

LABEL maintainer="Indrayana Rustandi"
ENV DOCKER_REGISTRY irustandi.azurecr.io
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && \
    apt install -y tmux && \
    apt install -y libopenmpi-dev && \
    apt install -y mpich && \
    rm -fr /var/lib/apt/lists

RUN conda install -y \
    matplotlib \
    seaborn \
    pandas \
    scikit-learn \
    scikit-image \
    nodejs \
    tensorflow=1.15.0
    
RUN python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir --upgrade \
    ipywidgets 

COPY . /spinningup/
WORKDIR /spinningup/
RUN python3 -m pip install -e .

RUN jupyter nbextension enable --py widgetsnbextension

CMD ["/bin/bash"]