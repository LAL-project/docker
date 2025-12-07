FROM ubuntu:24.04

RUN \
	apt update \
	&& \
	apt upgrade -y \
	&& \
	apt install -y \
		gcc-14 \
		g++-14 \
		libgmp-dev \
		cmake \
		swig \
		python3.12 \
		python3.12-dev \
		make \
	&& \
	apt clean

RUN \
	echo "source /workspace/scripts/bashrc_template.sh" >> /root/.bash_profile && \
	echo "source /workspace/scripts/bashrc_template.sh" >> /root/.bashrc

RUN \
	update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 100 && \
	update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 100

WORKDIR /workspace

CMD ["bash"]
