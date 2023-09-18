FROM rstudio/plumber:v1.1.0

RUN Rscript -e "install.packages('clinPK')"

COPY . /myproject
WORKDIR /myproject

ENTRYPOINT ["Rscript", "entrypoint.R"]
