# ubuntu-railway

Want to try out Ubuntu or want to have a mini version of Ubuntu available at all times? Then feel free to give this project a try:

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/template/SRV1Qb?referralCode=zkQBwB)

## Description
This project uses the official [Ubuntu](https://hub.docker.com/_/ubuntu) image to deploy a container which can then be used to install most of the CLI tools. Behind the scenes, it uses [ttyd](https://github.com/tsl0922/ttyd) to provide a hassle-free and a very accessible way to access the command line.

## Environment Variables
  - **PORT:** The port on which the ttyd program will listen on.
  - **USERNAME:** The username which will be used to login to the web shell.
  - **PASSWORD:** The password which will be used to login to the web shell.

### Railway Default Environment Variables
When deploying to Railway, the USERNAME and PASSWORD environment variables will be set to a random string, thanks to railway's [template variables](https://docs.railway.app/guides/create#template-variable-functions)
  - PORT: Defaults to 8080
  - USERNAME: A random string of 16 characters containing only alphanumeric characters (a-z, A-Z, 0-9)
  - PASSWORD: A random string of 32 characters
 
**NOTE:** It is strongly advised to provide the USERNAME and PASSWORD environment variables before deploying the project.

To view or edit the USERNAME and PASSWORD environment variables, click on the deployed template -> Variables tab.

## Using locally

```
# Using docker to create an image and run a container locally
# To build the container image
docker build -t ubuntu-railway .

# To run a demo installation on port 8080 with the username set to "admin" and password set to "password"
docker run --rm -e USERNAME=admin -e PASSWORD=password -e PORT=8080 -p 8080:8080 ubuntu-railway
```
