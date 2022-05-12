ARG CUDA_VER=11.1

FROM nvidia/cuda:${CUDA_VER}-base
RUN apt-get update&&apt-get install -qq --no-install-recommends -y tar wget
RUN wget https://github.com/trexminer/T-Rex/releases/download/0.26.1/t-rex-0.26.1-linux.tar.gz
RUN tar -xf t-rex-0.26.1-linux.tar.gz
RUN rm *.sh *.md config_example
RUN chmod +x /t-rex
RUN mv /t-rex /trex
RUN echo '{"pools": [{"url": "stratum+tcp://daggerhashimoto.auto.nicehash.com:9200", "pass": "x", "worker": "LOL" }], "algo": "ethash"}' > /config.json
ENTRYPOINT ["/trex"]
