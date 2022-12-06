B65;6602;1c# Apollo Tool

This repo is to simplify building the BUTool & friends software for the Apollo SM 

Currently this adds the BUTool-IPBus-helpers, ApolloSM_plugin, and genericIPBus_plugin.

### Common pre-req's
* boost-devel
* readline-devel
* ld
* uHAL 
* UIOuHAL plugin


### building on an apollo blade

CACTUS_ROOT=/opt/cactus LINTER=: make local UHAL_VER_MAJOR=2 UHAL_VER_MINOR=8 -j4 RUNTIME_LDPATH=/opt/BUTool COMPILETIME_ROOT=--sysroot=/
CACTUS_ROOT=/opt/cactus LINTER=: make install UHAL_VER_MAJOR=2 UHAL_VER_MINOR=8 RUNTIME_LDPATH=/opt/BUTool COMPILETIME_ROOT=--sysroot=/ INSTALL_PATH=/opt/BUTool
