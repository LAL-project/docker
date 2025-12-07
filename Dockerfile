FROM ubuntu:24.04

RUN \
	apt update \
	&& \
	apt upgrade -y \
	&& \
	apt install -y \
		git \
		gcc-14 \
		g++-14 \
		libgmp-dev \
		cmake \
		swig \
		make \
		python3.12 \
		python3.12-dev \
		python3.12-venv \
		texlive-font-utils \
		texlive-bibtex-extra \
		ghostscript \
		doxygen \
		locales \
	&& \
	apt clean

COPY ./scripts /workspace/scripts
COPY ./src /workspace/src

RUN \
	echo "source /workspace/scripts/bashrc_template.sh" >> /root/.bash_profile && \
	echo "source /workspace/scripts/bashrc_template.sh" >> /root/.bashrc

RUN \
	update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 100 && \
	update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 100

RUN \
	chmod +x /workspace/scripts/configure.sh && \
	chmod +x /workspace/scripts/compile.sh && \
	chmod +x /workspace/scripts/python_compile.sh

CMD bash
