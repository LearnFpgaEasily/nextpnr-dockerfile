# go on my icestorm-dockerfile repo to build this image: https://github.com/LearnFpgaEasily/icestorm-dockerfile
FROM icestorm:latest

RUN git clone https://github.com/YosysHQ/nextpnr nextpnr

RUN cd nextpnr; \ 
    git submodule init && git submodule update; \
    cmake . -DARCH=ice40 -DCMAKE_INSTALL_PREFIX=/usr/local; \
    make -j$(nproc); \
    make install