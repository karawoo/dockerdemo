# Docker demo

This repo contains a couple of sample dockerfiles to play around with. Check out
the subdirectories for examples of ways to dockerize plumber APIs, shiny apps,
and quarto reports.

Prerequisites: [install Docker](https://docs.docker.com/engine/install/). For
the plumber example, also install [curl](https://curl.se/).

## A note about reproducibility

I've tried to make these demos quite minimal. For simplicity, I install the
latest versions of R packages. However one of the benefits (indeed part of the
point) of docker is the ability to pin down very specific versions of
dependencies. You could do this by using a specific 
[Posit Package Manager](https://packagemanager.posit.co/client/#/) snapshot, 
or using [renv](https://rstudio.github.io/renv/articles/renv.html).
 
