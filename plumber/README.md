# Docker example: plumber API

This docker example creates a plumber API with two endpoints, `/lbs2kg` to
convert lbs to kb, and `/aki` to calculate acute kidney injury (AKI) stage.

You can build the docker image by running the following at the command line:

```
docker build -t plumber-demo .
```

Once the image is built, you can start a container to run the plumber API. The
following command will start the container, and map port 8000 within the
container to port 8000 on your machine, allowing you to interact with the API.

```
docker run -it -p 8000:8000 plumber-demo
```

You should see the following message:

```
Running plumber API at http://0.0.0.0:8000
Running swagger Docs at http://127.0.0.1:8000/__docs__/
```

If you see a warning message about the requested image's platform not matching
the detected host platform, you can ignore that.

Now you can send requests to the plumber API. Open a new tab in your terminal
and try the following:

```
curl "127.0.0.1:8000/lbs2kg?lbs=30"
```

The `/aki` endpoint requires somewhat more complex data than `/lbs2kg`. The
easiest way to provide it is as JSON data in a POST request:

```
curl -X POST \
  -H "Content-Type: application/json" \
  --data '{"scr": [0.7, 1.0], "times": [0, 12], "egfr": [60, 40]}' \
  "127.0.0.1:8000/aki" 
```
