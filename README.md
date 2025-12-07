# A Docker container for LAL

## Building the container

First, you have to build the Docker container.

### Requirements

The only tools required to use LAL via docker are

- `git`: Make sure the tool is available in your path.

- `docker`: you will find instructions to install Docker in a variety of platforms [here](https://docs.docker.com/engine/install/).

### Automatic build of the instance

The easiest way to build the instance is running the `launch` script. To install the latest version of the library (not recommended) issue the following command

	$ ./scripts/launch.sh

To install older, more stable versions of LAL run one of:

	$ ./scripts/launch.sh 24.10
	$ ./scripts/launch.sh 23.01
	$ ./scripts/launch.sh 21.07

The script will log you into the instance. There you will have to run the command

	# ./scripts/configure.sh

### Manual build of the instance

To build the instance you have to download the `linear-arrangement-library` repository and the `python-interface` repository. After that, select the version of the library you want to work with by running

	$ git fetch origin $v
	$ git checkout $v

where `$v` denotes the version, one of `24.10`, `23.01`, `21.07`. Then run the commands

	$ docker compose up -d --build
	$ docker compose exec lal-build bash

## Working with the container

This container is prepared to be used with Visual Studio Code. Open an instance of VS Code, in VS Code open the current folder, and then connect to the container using the `containers` extension in VS Code. To use LAL with python, you can open a Jupyter Notebook and start typing there; you can make your own virtual environment or select the one that Docker built for you, located in the directory:

	/workspace/.lal

You can also work form your terminal inside the container by running the command

	$ docker compose exec lal-build bash

The `/workspace` directory is configured so that every file created in there from within the container will also be part of your file system.
