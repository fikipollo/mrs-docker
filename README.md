MRS docker image
===================
The [MRS](http://mrs.cmbi.ru.nl/) [Docker](http://www.docker.io) Image is an easy distributable full-fledged MRS installation.
MRS is a search engine for biological and medical databanks. Use it to search well over a terabyte of indexed text.

This docker image extends and distributes the following software:

#### MRS

- Based on [MRS project](http://mrs.cmbi.ru.nl/).
- MRS was designed and implemented by Maarten Hekkelman at the CMBI. [Boost Software License - Version 1.0.](https://raw.githubusercontent.com/bgruening/docker-galaxy-stable/master/LICENSE).
- Citation:
> MRS: A fast and compact retrieval system for biological data. Hekkelman M.L., Vriend G.
Nucleic Acids Research 2005 33(Web Server issue):W766-W769; doi:10.1093/nar/gki422. [Link](https://academic.oup.com/nar/article/33/suppl_2/W766/2505577/MRS-a-fast-and-compact-retrieval-system-for?ijkey=1hM9Po54JADYz0b&keytype=ref)

# Build the image
The docker image for MRS can be found in the [docker hub](https://hub.docker.com/r/fikipollo/mrs/). However, you can rebuild is manually by running **docker build**.

```sh
sudo docker build -t mrs .
```
Note that the current working directory must contain the Dockerfile file.

## Running the Container
The recommended way for running your MRS docker is using the provided **docker-compose** script that resolves the dependencies and make easier to customize your instance. Alternatively you can run the docker manually.

## Quickstart

This procedure starts MRS in a standard virtualised environment.
- Install [docker](https://docs.docker.com/engine/installation/) for your system if not previously done.
- `docker run -it -p 18090:18090 -v /your/data/location:/data fikipollo/mrs`
- MRS will be available at [http://localhost:18090/](http://localhost:18090/)

## Using the docker-compose file
Launching your MRS docker is really easy using docker-compose. Just download the *docker-compose.yml* file and customize the content according to your needs. There are few settings that should be change in the file, follow the instructions in the file to configure your container.

To launch the container, type:
```sh
sudo docker-compose up
```
Using the *-d* flag you can launch the containers in background.

In case you do not have the Container stored locally, docker will download it for you.

# Install the image
You can run manually your containers using the following commands:

```sh
sudo docker run --name mrs -v /your/data/location/mrs-data:/data -e MRS_ADMIN_EMAIL=admin -e MRS_ADMIN_PASSWORD=supersecret -p 8042:80 -d fikipollo/mrs
```

In case you do not have the Container stored locally, docker will download it for you.

A short description of the parameters would be:
- `docker run` will run the container for you.

- `-p 18090:18090` will make the port 18090 (inside of the container) available on port 18090 on your host.
    Inside the container an MRS Webserver is running on port 18090 and that port can be bound to a local port on your host computer.
    With this parameter you can access to the MRS instance via `http://localhost:18090` immediately after executing the command above.

- `fikipollo/mrs` is the Image name, which can be found in the [docker hub](https://hub.docker.com/r/fikipollo/mrs/).

- `-d` will start the docker container in daemon mode.

- `-e VARIABLE_NAME=VALUE` changes the default value for a system variable.
The Pulsar docker accepts the following variables that modify the behavior of the system in the docker.

    - **MRS_ADMIN_EMAIL**, the name for the admin account. Using this account you can access to the admin portal (e.g. [http://yourserver:18090/admin](http://yourserver:18090/admin)) and manipulate the installed databanks.
    - **MRS_ADMIN_PASSWORD**, the password for the admin user.


# Installing data in MRS
The MRS software provides the tools to rapidly and reliably download, store, index, and query flat-file databanks. Data stored and indexed by MRS takes considerably less space on disk than the raw data, despite that these raw data are included.

For current version data must be installed manually using an interactive command-line terminal.
For example, for installing a new databank in the system, you should type:
```sh
> docker exec -it <CONTAINER_NAME> /bin/bash
$ m6 fetch enzyme
$ m6 build enzyme
```
All data will be stored at /data/ directory.

# Version log
  - v0.9 August 2017: First version of the docker. MRS version 6.0.5.
