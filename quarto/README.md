# Docker demo: quarto

This folder contains a demo creating a Quarto HTML report with docker.

You can build the docker image by running the following at the command line:

```
docker build -t report-demo .
```

Once the image is built, you can start a container to run the report. In this
example, we use [bind mounts](https://docs.docker.com/storage/bind-mounts/) to
mount the current directory to a directory within the docker container so that
we can access the output files on our machine.

```
docker run --mount type=bind,source=${PWD},target=/myproject report-demo "report.qmd"
```

## Note about architecture

I am writing this demo on a mac with an M2 chip. If you have an Intel processor, you may need to edit the Dockerfile to install a different version of quarto. Try replacing these lines:

```
RUN curl -LO https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-arm64.deb
RUN gdebi --non-interactive quarto-1.3.450-linux-arm64.deb
```

with 

```
RUN curl -LO https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb
RUN gdebi --non-interactive quarto-1.3.450-linux-amd64.deb
```
