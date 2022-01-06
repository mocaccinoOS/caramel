FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends autoconf libmemcached-dev asciidoc xsltproc docbook-xml docbook-xsl git ca-certificates gcc build-essential gperf
RUN git clone https://github.com/afbjorklund/memccache && cd memccache && \
   ./autogen.sh && \
   ./configure --enable-memcached && \
   make -j4 && make install