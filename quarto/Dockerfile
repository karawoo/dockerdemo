FROM rocker/r-ver:4.3.1

RUN apt-get update && apt-get install -y \
    pandoc \
    pandoc-citeproc \
    curl  \
    gdebi-core

RUN Rscript -e "install.packages(c('quarto', 'ggplot2', 'palmerpenguins'))"

RUN curl -LO https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-arm64.deb
RUN gdebi --non-interactive quarto-1.3.450-linux-arm64.deb

RUN mkdir /myproject
WORKDIR myproject

ENTRYPOINT ["quarto", "render"]
