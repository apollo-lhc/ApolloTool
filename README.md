# Apollo Tool

This repo is to simplify building the BUTool & friends software for the Apollo SM Petalinux system via cross compiling. 

Currently this adds the BUTool-IPBus-helpers, ApolloSM_plugin, and genericIPBus_plugin.

### Common pre-req's
* petalinux 2018.2
* boost-devel
* readline-devel
* ld
* uHAL (with plugin support)
* UIOuHAL plugin

### Zynq build via SM_ZYNQ_FW CentOS makefile
* cd SM_ZYNQ_FW/os/centos
* make (builds full centos image for zynq including this repo)

### "local" x86 (for syntax checking)
* make local


### How-to old with cross-compile
* Build the petalinux image for the Apollo SM via https://github.com/apollo-lhc/SM_ZYNQ_FW
* Mount the ext4 image generated from that in /mnt
* Build the feature-UIOuHAL branch from https://github.com/dgastler/ipbus-software
* Set IPBUS_PATH CACTUS_ROOT to point to whhere you checked out the ipbus-software repo
* make
* cd BUTool; ZYNQ_IP=1.2.3.4 ./make/copyZynq.sh
* Yay! you are done!

### StatusDisplay name parser for BUTool

Currently, there are two versions of name parsers (for row and column names in status tables) used in `BUTool::StatusDisplay` class:

**Older version:** Will treat a single underscore character (`'_'`) in the beginning as a spcecial character. As an example, if we had a register with name `A.B.C.D` and parameter `Row=_3`, the row name for this register would be `C`. 

**Newer version:** Will treat double and triple underscore characters as special. Double underscore replaces the single underscore functionality in the older version, while triple underscore implies a reverse count. Using the same example from before, if we had a register with name `A.B.C.D`, the following is true:

- If this register specifies `Row=__3`, the row name would be `C`.
- If this register specifies `Row=___3`, the row name would be `B`.

By default, when the `BUTool::StatusDisplay` class parses the XML address table, it will use the older version of the name parser. This behavior can be updated by using a compile-time flag however, called `BUTOOL_SD_USE_NEW_PARSER`. To use the new name parser, the user can simply add `BUTOOL_SD_USE_NEW_PARSER=true` to the `make` command while building `ApolloTool`.

### TODO
* Simplify the petalinux image use by downloading tagged releases of the system images. 
* Add option to automatically checkout and build ipbus or use an existing installation
* Add IPMI plugin to build system
