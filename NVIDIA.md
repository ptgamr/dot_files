### System
Ubuntu 24.04
Kernel 6.11 (To install different kernel, use `mainline`)

```
mainline list
sudo mainline install 6.11
```


### Driver

Make sure you have gcc 14 install (gcc 13 installation will failed)

```
sudo apt install gcc-14 g++-14
export CC=/usr/bin/gcc-14

sudo apt --purge remove 'nvidia-*'
sudo apt install nvidia-driver-570
```
