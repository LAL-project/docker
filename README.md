# A Docker container for LAL

This repository contains instructions on how to build a docker instance for the [Linear Arrangement Library](https://github.com/LAL-project/linear-arrangement-library). There are specific instructions for each version, each located in its own branch of this repository. To access the each version's specific instructions, issue the following commands

	$ git clone https://github.com/LAL-project/docker
	$ git fetch origin $v
	$ git checkout $v

where `$v` is the specific version of the library.

## Building the container

First, you have to build the Docker container.

### Requirements

The only tools required to use LAL via docker are

- `git`: Make sure the tool is available in your path.

- `docker`: you will find instructions to install Docker in a variety of platforms [here](https://docs.docker.com/engine/install/).

### Automatic build of the instance

The easiest way to build the instance is running the `launch` script. To install the latest version of the library (not recommended) issue the following command

	$ ./scripts/launch.sh

The script will log you into the instance. There you will have to run the command

	# ./scripts/configure.sh

### Manual build of the instance

To build the instance you have to download the `linear-arrangement-library` repository and the `python-interface` repository. After that, select the version of the library you want to work with by running

	$ git fetch origin 23.01
	$ git checkout 23.01

Then run the commands

	$ docker compose up -d --build
	$ docker compose exec lal-build bash

## Working with the container

This container is prepared to be used with Visual Studio Code. Open an instance of VS Code, in VS Code open the current folder, and then connect to the container using the `containers` extension in VS Code. To use LAL with python, you can open a Jupyter Notebook and start typing there; you can make your own virtual environment or select the one that Docker built for you, located in the directory:

	/workspace/.lal

You can also work form your terminal inside the container by running the command

	$ docker compose exec lal-build bash

The `/workspace` directory is configured so that every file created in there from within the container will also be part of your file system.
