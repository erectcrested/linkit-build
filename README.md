# linkit-build
## Linkit build environment

### SDK only container:
1. Install Docker
2. [Download](https://labs.mediatek.com/en/platform/linkit-smart-7688):<br />
    OpenWrt-Toolchain-ramips-mt7688_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2 <br />
    OpenWrt-SDK-ramips-mt7688_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2 <br />
From [linkit smart](https://labs.mediatek.com/en/platform/linkit-smart-7688) website <br />
3. Put downloaded files and this repository in the same folder and change directory to this folder
4. Build instructions:
```
	docker build -t linkitsdk -f Dockerfile_sdk .
	docker run -it linkitsdk 
```


### Full build environment
1. Install Docker
2. [Download](https://git.openwrt.org/?p=15.05/openwrt.git;a=summary):<br />
    OpenWrt-15.05 <br />
From [openwrt](https://labs.mediatek.com/en/platform/linkit-smart-7688) website <br />
3. Put downloaded files and this repository in the same folder and change directory to this folder
4. Build instructions:
```
	docker build -t linkitfull -f Dockerfile_full_env .
	docker run -it linkitfull 
```
