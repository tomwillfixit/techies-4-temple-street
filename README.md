# techies-4-temple-street

"Now in its 4th year, join over 1,500 members of the Irish tech and business communities and take to the streets of Dublin for a unique treasure trail, combining outdoor activities with digital media challenges whilst making an impact to the lives of sick children across Ireland." http://www.techies4templestreet.ie/

Background : https://twitter.com/Techies4TS/status/948896574419202050

Based on https://github.com/alexellis/mine-with-docker from Docker Captain Alex Ellis.  

Disclaimer: this software is provided with no warranty. Use at your own risk. If you plan to mine on a cloud check the terms and conditions before you start. The same applies if you are using private equipment or an on-site datacenter for mining.


# Getting started

The first step is to install Docker.  Instructions can be found [here](https://docs.docker.com/engine/installation/#desktop).
This will only take a few minutes.

Check Docker is installed 
```
docker info
```

I've created a wallet on behalf of Techies 4 Temple Street.  I'll share access to this wallet with someone from Techies 4 Temple Street to avoid ...

![ted](img/ted.jpg)

## Build container image
```
make build
```

## Start container

Before starting the container it's best to decide how many resources you are willing to dedicate to this container.

This container was tested on a Ubuntu 16.04 with Intel® Core™ i7-6600U CPU @ 2.60GHz × 4.

In the makefile there are 2 hardcoded values for cpu and cpuset :
 
The cpus argument will restrict the number of cpus available to the techies container.

The cpuset argument restricts which physical core the container will use.  In a 4 core CPU the cpu ids are 0,1,2,3.

Running the command below will start the container and keep cpu core 0 pinned at 100% usage.

Feel free to tweak based on your resources and using this [link](https://docs.docker.com/engine/admin/resource_constraints/#cpu) for guidance.


There are 2 ways to start the container. The first way will allow you to track your individual contribution by adding a label to your worker.
```
make start label=bob123
```
The second way will just start the container with a default "t4ts" label.
```
make start
```
## Check CPU usage

You can use a tool like top or htop to view the CPU usage.  Docker also has a useful command to show this info per container.
```
docker stats --no-stream techies 

or

docker stats techies

Example Output :

CONTAINER ID        NAME                CPU %               MEM USAGE / LIMIT     MEM %               NET I/O             
5e86990340b9        techies             100.44%             67.13MiB / 19.04GiB   0.34%               69.6kB / 12kB

```
## Watch the logs
```
make logs
```

## Stop and remove container
```
make cleanup
```

## Mining Status

To check the status of the mining use this [link](https://www.nicehash.com/miner/1KW1jDtPrFDn4QCedtJgSsAz4BmtLN7ma)
