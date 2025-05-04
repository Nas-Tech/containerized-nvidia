FROM nvidia/cuda:12.8.1-devel-ubuntu24.04

# Install required dependencies for nvvp GUI
RUN apt-get update && apt-get install -y \
    libx11-6 libxext6 libxmu6 libxi6 libglu1-mesa \
    wget

WORKDIR /root

# nvvp is included in CUDA Toolkit
RUN apt-get install -y cuda-toolkit

# nvvp requires java JRE
RUN apt-get install -y openjdk-8-jdk
RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# install vim to have an editor in the container
RUN apt-get install -y vim
RUN echo 'set tabstop=4\nfiletype indent on\nset smartindent\nautocmd BufRead,BufWritePre *.sh normal gg=G' >> .vimrc

# ensure the container doesn't exit
CMD tail -f /dev/null
