FROM rocker/shiny-verse:4.2.0

RUN Rscript -e "install.packages('palmerpenguins', repos = 'https://packagemanager.rstudio.com/cran/__linux__/focal/2022-08-16')"

COPY penguins.R /myproject/penguins.R
COPY app.R /myproject/app.R

CMD ["/bin/bash"]
#CMD ["Rscript", "-e", "shiny::runApp('/myproject/app.R', host = '0.0.0.0', port = 3838)"]
