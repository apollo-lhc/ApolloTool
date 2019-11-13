# Apollo Tool

This repo is to simplify building the BUTool & friends software for the Apollo SM Petalinux system via cross compiling. 

Currently this adds the BUTool-IPBus-helpers, ApolloSM_plugin, and genericIPBus_plugin.

### Common pre-req's
* petalinux 2018.2
* boost-devel
* readline-devel
* ld

### How-to (in the end)
* make
* cd BUTool; ZYNQ_IP=1.2.3.4 ./make/copyZynq.sh
* Yay! you are done!

### How-to currently 
* Build the petalinux image for the Apollo SM via https://github.com/apollo-lhc/SM_ZYNQ_FW
* Mount the ext4 image generated from that in /mnt
* Build the feature-UIOuHAL branch from https://github.com/dgastler/ipbus-software
* Set IPBUS_PATH CACTUS_ROOT to point to whhere you checked out the ipbus-software repo
* make
* cd BUTool; ZYNQ_IP=1.2.3.4 ./make/copyZynq.sh
* Yay! you are done!


### TODO
* Simplify the petalinux image use by downloading tagged releases of the system images. 
* Add option to automatically checkout and build ipbus or use an existing installation
* Add IPMI plugin to build system