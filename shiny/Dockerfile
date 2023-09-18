FROM rocker/shiny-verse:4.3.0

RUN Rscript -e "install.packages('palmerpenguins')"

COPY app.R /myproject/app.R

CMD ["Rscript", "-e", "shiny::runApp('/myproject/app.R', host = '0.0.0.0', port = 3838)"]
