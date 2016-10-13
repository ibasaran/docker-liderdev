# How to run lider development environment

## CONFIGURE WORKSPACE

Create a folder for development environment otherwise for every docker run command will download lider code base and build it. 
```
-v $USER_HOME/dev:/home/lider
```
replace **$USER_HOME/dev** path with your path selection and add this volume to docker run command. 

For the first time docker run command will download and build your lider codes. If you dont wan to download automatically lider codes, you can do it manually. 

**Manually Manage Your Codes**

For managing your code manully, set below environment variables to "**false**" value
```
-e CLONE_PROJECTS="false"
-e BUILD_PROJECTS="false"
-e PULL_PROJECTS="false"
```

### USE GIT OVER SSH

add environment settings to docker run command 
```
-e USE_SSH_FOR_GIT="true"
```
and add your ssh folder as volume
```
-v $USER_HOME/.ssh:/home/lider/.ssh
```
replace $USER_HOME with your home path. 


### USE GIT OVER HTTPS

add environment settings to docker run command 

```
-e USE_SSH_FOR_GIT="false"
```

### HOW TO RUN 
```
docker run -it --rm -e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $USER_HOME/dev:/home/lider/ \
	-v $USER_HOME/.ssh:/home/lider/.ssh \
	ibasaran/lider-console-dev
```


### ENVIRONMENT VARIABLES


### DOCKER COMPOSE