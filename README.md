
Ubuntu 32-bit Image with nginx Web Server
-----------------------------------------

This image extends the 32-bit Ubuntu core with the [nginx web server](http://nginx.org/en/) packages from the Ubuntu repositories.

### Depends On

  * [f69m/ubuntu32-runit](https://hub.docker.com/r/f69m/ubuntu32-runit/)

### Installation

The latest build of this image can readily be pulled from Docker Hub:

    $ docker pull f69m/ubuntu32-nginx

### Usage

This image is very similar to the [official nginx Docker image](https://hub.docker.com/_/nginx/). The following usage examples are losely based on its documentation.

#### Serve static content from a host directory

    $ docker run -d --name nginx -v /some/content:/usr/share/nginx/html:ro f69m/ubuntu32-nginx

#### Create a derived image with static content

The static contents can be added to a new image using and building a simple `Dockerfile`:

    FROM f69m/ubuntu32-nginx
    COPY static-html-directory /usr/share/nginx/html

From the directory containing the `Dockerfile` build the new image with:

    $ docker build -t nginx-static .

Then run it like this:

    $ docker run -d --name nginx nginx-static

### Contribute

You are welcome to discuss this image, report issues or contribute changes on Github or leave comments on Docker Hub.

  * [f69m/ubuntu32-nginx](https://hub.docker.com/r/f69m/ubuntu32-nginx/) on Docker Hub
  * [f69m/docker-ubuntu32-nginx](https://github.com/f69m/docker-ubuntu32-nginx/) on Github

