![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-orange?logo=ubuntu)
![Docker](https://img.shields.io/badge/Docker-Supported-blue?logo=docker)
# Ubuntu-Railway

Want to try out Ubuntu or want to have a mini version of Ubuntu available at all times? Then feel free to give this project a try:

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/template/4lvigd?referralCode=zkQBwB)

## Description
This project uses the official [Ubuntu](https://hub.docker.com/_/ubuntu) image to deploy a container which can then be used to install most of the CLI tools. Behind the scenes, it uses [ttyd](https://github.com/tsl0922/ttyd) to provide a hassle-free and a very accessible way to access the command line.

## Environment Variables
  - **PORT:** The port on which the ttyd program will listen on.
  - **USERNAME:** The username which will be used to login to the web shell.
  - **PASSWORD:** The password which will be used to login to the web shell.
 
**NOTE:** It is strongly advised to provide the USERNAME and PASSWORD environment variables before deploying the project.
