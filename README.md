# linkit-build
## Linkit build environment

### Prepare:

1. Install Docker:
2. [Download](https://labs.mediatek.com/en/platform/linkit-smart-7688):

    OpenWrt-Toolchain-ramips-mt7688_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2
    OpenWrt-SDK-ramips-mt7688_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2

From [linkit smart](https://labs.mediatek.com/en/platform/linkit-smart-7688) website
3. Put downloaded files and this repository in the same folder and change directory to this folder

### Build Instructions:
```
docker build -t linkitenv .
docker run -it linkitenv 
```
