FROM ubuntu:24.04

RUN \
	apt update \
	&& \
	apt upgrade -y \
	&& \
	apt install -y \
		software-properties-common \
		wget \
		git \
		gcc-14 \
		g++-14 \
		libgmp-dev \
		cmake \
		automake \
		autoconf \
		make \
		texlive-font-utils \
		texlive-bibtex-extra \
		ghostscript \
		doxygen \
		locales \
		libpcre2-dev \
		libpcre3 \
		libpcre3-dev \
		yacc \
		bison \
	&& \
	apt install -y \
		python3.12 \
		python3.12-dev \
		python3.12-venv \
	&& \
	apt clean

RUN \
	echo "source /workspace/scripts/bashrc_template.sh" >> /root/.bash_profile && \
	echo "source /workspace/scripts/bashrc_template.sh" >> /root/.bashrc

RUN \
	update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 100 && \
	update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 100

CMD bash
