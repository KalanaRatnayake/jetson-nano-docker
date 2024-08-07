# Jetson Docker

This repository contains dockerfiles for base images for Jetson Nano and Jetson AGX Orin devices. Following table contains a summary about available images and the main packages they contain and the device in which the image has been tested on. 

>**jetson-\* images are custom images I created while l4t-\* images are official images from nvidia. l4t-\* images are included here for the completeness**

| Image              |  Tag                     | Size    | Jetson Nano | Jetson AGX Orin |
| :----              | :-----                   | :----:  | :---------: | :-------------: |
| jetson-base        | r32.7.1                  |  822 MB | <ul><li> - [x] </li></ul> | |
| l4t-base           | r36.2.0                  |  750 MB | | <ul><li> - [x] </li></ul> |
| jetson-minimal     | r32.7.1                  | 1.11 GB | <ul><li> - [x] </li></ul> | |
| l4t-cuda           | 12.2.12-devel            | 2.81 GB | | <ul><li> - [x] </li></ul> |
| l4t-cuda           | 12.2.12-runtime          | 1.41 GB | | <ul><li> - [x] </li></ul> |
| jetson-ros         | humble-core-r32.7.1      | 1.71 GB | <ul><li> - [x] </li></ul> | |
| jetson-ros         | humble-core-r36.3.0      | 1.40 GB | | <ul><li> - [x] </li></ul> |
| jetson-ros         | humble-base-r32.7.1      | 1.76 GB | <ul><li> - [x] </li></ul> | |
| jetson-ros         | humble-base-r36.3.0      | 1.45 GB | | <ul><li> - [x] </li></ul> |
| jetson-pytorch     | 1.13-r32.7.1             | 1.83 GB | <ul><li> - [x] </li></ul> | |
| jetson-pytorch     | r36.3.0                  | 1.26 GB | | <ul><li> - [x] </li></ul> |
| jetson-ros-pytorch | 1.13-humble-core-r32.7.1 | 3.05 GB | <ul><li> - [x] </li></ul> | |
| jetson-ros-pytorch | humble-core-r36.3.0      | 1.91 GB | | <ul><li> - [x] </li></ul> |


| Image              |  Tag                     | Content                                                          |
| :----              | :-----                   | :--------------------------------------                          |
| jetson-base        | r32.7.1                  | Ubuntu 20.04, Python 3.8.10, CUDA 10.2                           |
| l4t-base           | r36.2.0                  | Ubuntu 22.04, Python 3.10.12                                     |
| jetson-minimal     | r32.7.1                  | `jetson-base:r32.7.1` + GCC-8, G++-8, build-essentials           |
| l4t-cuda           | 12.2.12-devel            | `l4t-base:r36.2.0` + CUDA 12.2, GCC-11, G++-11, build-essentials |
| l4t-cuda           | 12.2.12-runtime          | `l4t-base:r36.2.0` + CUDA 12.2, GCC-11, G++-11, build-essentials |
| jetson-ros         | humble-core-r32.7.1      | `jetson-base:r32.7.1` + [ROS Humble Core](https://www.ros.org/reps/rep-2001.html#id23)    |
| jetson-ros         | humble-core-r36.3.0      | `l4t-base:r36.2.0` + [ROS Humble Core](https://www.ros.org/reps/rep-2001.html#id23)    |
| jetson-ros         | humble-base-r32.7.1      | `jetson-base:r32.7.1` + [ROS Humble Base](https://www.ros.org/reps/rep-2001.html#id24)    |
| jetson-ros         | humble-base-r36.3.0      | `l4t-base:r36.2.0` + [ROS Humble Base](https://www.ros.org/reps/rep-2001.html#id24)    |
| jetson-pytorch     | 1.13-r32.7.1             | `jetson-base:r32.7.1` + PyTorch 1.13.0, TorchVision 0.14.0           |
| jetson-pytorch     | r36.3.0                  | `l4t-base:r36.2.0` + PyTorch 2.4.0, TorchVision 0.19.0, TorchAudio 2.4.0   |
| jetson-ros-pytorch | 1.13-humble-core-r32.7.1 | `jetson-ros:humble-core-r32.7.1` + PyTorch 1.13.0, TorchVision 0.14.0 |
| jetson-ros-pytorch | humble-core-r36.3.0      | `jetson-ros:humble-core-r36.3.0` + PyTorch 2.4.0, TorchVision 0.19.0, TorchAudio 2.4.0 |


> build essential package for ubuntu 20.04 includes g++-9, gcc-9, make, dpkg-dev, libc6-dev \
> build essential package for ubuntu 22.04 includes g++-11, gcc-11, make, dpkg-dev, libc6-dev

## Docker buildx for ARM64 platform on AMD64 systems

Run the following command on a AMD64 computer to setup buildx to build arm64 docker containers.
```bash
docker buildx create --use --driver-opt network=host --name MultiPlatform --platform linux/arm64
```
## Docker buildx for ARM64 platform on Jetson devices

Run the following command on a Jetson device to setup buildx to build arm64 docker containers.
```bash
docker buildx create --use --driver=docker-container --name=container --buildkitd-flags '--debug' --bootstrap
```

## Docker container list

### 1. Jetson Base

#### jetson-base:r32.7.1 

```docker
FROM ghcr.io/kalanaratnayake/jetson-base:r32.7.1
```
[Installation and local build instructions for jetson-base:r32.7.1 ](base-images/r3271.md)

#### l4t-base:r36.2.0 

```docker
FROM nvcr.io/nvidia/l4t-base:r36.2.0
```
[Installation, Testing instructions for l4t-base:r36.2.0 ](base-images/r3620.md)

<br>

### 2. Jetson Minimal

#### jetson-minimal:r32.7.1 

```docker
FROM ghcr.io/kalanaratnayake/jetson-minimal:r32.7.1
```
[Installation, Testing and local build instructions for jetson-minimal:r32.7.1](minimal-images/r3271.md)

#### l4t-cuda:12.2.12-devel 

```docker
FROM nvcr.io/nvidia/l4t-cuda:12.2.12-devel
```
[Installation, Testing instructions for l4t-cuda:12.2.12-devel](minimal-images/r3620d.md)

#### l4t-cuda:12.2.12-runtime 

```docker
FROM nvcr.io/nvidia/l4t-cuda:12.2.12-runtime
```
[Installation instructions for l4t-cuda:12.2.12-runtime](minimal-images/r3620r.md)

<br>

### 3. Jetson ROS 

#### jetson-ros:humble-core-r32.7.1

```docker
FROM ghcr.io/kalanaratnayake/jetson-ros:humble-core-r32.7.1
```
[Installation, Testing and local build instructions for jetson-ros:humble-core-r32.7.1](ros-images/r3271.humble_core.md)


#### jetson-ros:humble-base-r32.7.1

```docker
FROM ghcr.io/kalanaratnayake/jetson-ros:humble-base-r32.7.1
```
[Installation, Testing and local build instructions for jetson-ros:humble-base-r32.7.1](ros-images/r3271.humble_base.md)

#### jetson-ros:humble-core-r36.3.0

```docker
FROM ghcr.io/kalanaratnayake/jetson-ros:humble-core-r36.3.0
```
[Installation, Testing and local build instructions for jetson-ros:humble-core-r36.3.0](ros-images/r3630.humble_core.md)


#### jetson-ros:humble-base-r36.3.0

```docker
FROM ghcr.io/kalanaratnayake/jetson-ros:humble-base-r36.3.0
```
[Installation, Testing and local build instructions for jetson-ros:humble-base-r36.3.0](ros-images/r3630.humble_base.md)


<br>

### 4. Jetson Pytorch 

#### jetson-pytorch:1.13-r32.7.1

```docker
FROM ghcr.io/kalanaratnayake/jetson-pytorch:1.13-r32.7.1
```
[Installation, Testing and local build instructions for jetson-pytorch:1.13-r32.7.1](pytorch-images/r3271.113.md)

#### jetson-pytorch:r36.3.0

```docker
FROM ghcr.io/kalanaratnayake/jetson-pytorch:r36.3.0
```
[Installation, Testing and local build instructions for jetson-pytorch:r36.3.0](pytorch-images/r3630.md)


<br>

### 4. Jetson ROS Pytorch 

#### jetson-ros-pytorch:1.13-humble-core-r32.7.1

```docker
FROM ghcr.io/kalanaratnayake/jetson-ros-pytorch:1.13-humble-core-r32.7.1
```
[Installation, Testing and local build instructions for jetson-ros-pytorch:1.13-humble-core-r32.7.1](ros-pytorch-images/r3271.humblecore_pytorch113.md)

#### jetson-ros-pytorch:humble-core-r36.3.0

```docker
FROM ghcr.io/kalanaratnayake/jetson-ros-pytorch:humble-core-r36.3.0
```
[Installation, Testing and local build instructions for jetson-ros-pytorch:humble-core-r36.3.0](ros-pytorch-images/r3630.humblecore_pytorch.md)

<br>
