# Docker container for Scanpy and Jupyter

Dockerfile for my own use.

It's on [dockerhub](https://hub.docker.com/r/naotokubota/my_notebook) and [github](https://github.com/NaotoKubota/my_notebook).

## tags and links

- `1.0` [(master/Dockerfile)](https://github.com/NaotoKubota/my_notebook/blob/master/Dockerfile)

## how to build

```sh
docker pull naotokubota/my_notebook:1.0
```

or

```sh
git clone git@github.com:NaotoKubota/my_notebook.git
cd my_notebook
docker build --rm -t naotokubota/my_notebook:1.0 .
```

## running

```sh
docker run --rm -v `pwd`:/home/jovyan/work -p 10000:8888 naotokubota/my_notebook:1.0
```

Copy token, access `localhost:10000` on your local browser, and paste token.
