# Docker demo

Prerequisites: [install Docker](https://docs.docker.com/engine/install/)

To build the image:

```
docker build -t penguins .
```

To run a container based on the image:

```
docker run -it penguins
```

To run the shiny version, comment out the second to last line of the Dockerfile
and uncomment the last line. Then re-build the image and run a container, mapping
port 3838 from the container to your host machine.

```
docker build -t penguins .
docker run -p 3838:3838 penguins
```

You can then view the running shiny app at http://localhost:3838/. 

## Getting output from the container

You might want to generate some output in the Docker container (i.e. a report)
and access it from your machine. One way to do this is by using [bind
mounts](https://docs.docker.com/storage/bind-mounts/). I've added another
Dockerfile that creates a PDF report. Use the commands below to build the image
and run the report, which will be stored in the `output` directory.

```
docker build -t penguinsreport --file Dockerfile.report .
mkdir output
docker run --mount type=bind,source=${PWD}/output,target=/output penguinsreport
```

## A note about reproducibility

For maximum reproducibility, you should make sure to install specific versions
of your dependencies. Otherwise, if you build the docker image on two different
days you might get two different versions of the dependency. In this example I
install palmerpenguins from
https://packagemanager.rstudio.com/cran/__linux__/focal/2022-08-16 which is tied
to a specific day, so it'll always get the version of palmerpenguins from that
day.
