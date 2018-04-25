# [dclong/jupyterlab-spark](https://hub.docker.com/r/dclong/jupyterlab-spark/)

Spark with JupyterLab in Docker.

## About the Author

[Personal Blog](http://www.legendu.net)   |   [GitHub](https://github.com/dclong)   |   [Bitbucket](https://bitbucket.org/dclong/)   |   [LinkedIn](http://www.linkedin.com/in/ben-chuanlong-du-1239b221/)

## Usage in Linux/Unix

```
docker run -d \
    --log-opt max-size=50m \
    -p 8888:8888 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -e DOCKER_PASSWORD=`id -un` \
    -v $HOME:/workdir \
    dclong/jupyterlab-spark
```
## Image Tree Related to [dclong/jupyterlab-spark](https://hub.docker.com/r/dclong/jupyterlab-spark/)

[dclong/ubuntu_b](https://hub.docker.com/r/dclong/ubuntu_b/)

- [dclong/python](https://hub.docker.com/r/dclong/python/)
    - [dclong/jupyterlab](https://hub.docker.com/r/dclong/jupyterlab/)
        - [dclong/jupyterlab-jdk](https://hub.docker.com/r/dclong/jupyterlab-jdk/)
            - [dclong/jupyterlab-scala](https://hub.docker.com/r/dclong/jupyterlab-scala/)
                - [dclong/jupyterlab-spark](https://hub.docker.com/r/dclong/jupyterlab-spark/)

