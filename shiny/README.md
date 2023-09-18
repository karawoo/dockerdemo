# Docker example: shiny app

This docker example creates a shiny app. 

You can build the docker image by running the following at the command line:

```
docker build -t shiny-demo --platform linux/amd64 .
```

Once the image is built, you can start a container to run the shiny app. The
following command will start the container, and map port 3838 within the
container to port 3838 on your machine, allowing you to interact with the app.

```
docker run -p 3838:3838 shiny-demo
```

Now you can view the shiny app in your browser at http://localhost:3838/.
