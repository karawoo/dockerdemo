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

## A note about reproducibility

For maximum reproducibility, you should make sure to install specific versions
of your dependencies. Otherwise, if you build the docker image on two different
days you might get two different versions of the dependency. In this example I
install palmerpenguins from
https://packagemanager.rstudio.com/cran/__linux__/focal/2022-08-16 which is tied
to a specific day, so it'll always get the version of palmerpenguins from that
day.
