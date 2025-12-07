# A Docker container for LAL

## Requirements

The only tools required to use LAL via docker are

- `git`: Make sure the tool is available in your path.

- `docker`: you will find instructions to install Docker in a variety of platforms [here](https://docs.docker.com/engine/install/).

## Automatic build of the instance

The easiest way to build the instance is running the `launch` script:

	$ ./scripts/launch.sh

This script has an optional parameter that indicates the version of the library you want to work with. Not passing any parameter downloads the latest version of the library, which may not compile. For older, more stable versions, run one of:

	$ ./scripts/launch.sh 24.10
	$ ./scripts/launch.sh 23.01
	$ ./scripts/launch.sh 21.07

## Manual build of the instance

To build the instance you have to download the `linear-arrangement-library` repository and the `python-interface` repository. After that, select the version of the library you want to work with by running

	$ git fetch origin $v
	$ git checkout $v

where `$v` denotes the version, one of `24.10`, `23.01`, `21.07`. Then run the commands

	$ docker compose up --build
	$ docker compose run --rm lal-build bash
