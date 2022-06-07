#LIBRARY_EXCEPTION_SOURCES  = 
#LIBRARY_EXCEPTION_OBJECT_FILES = 

PLUGINS= $(wildcard plugins/*)
SYM_LINKS=$(patsubst %,BUTool/%,${PLUGINS})

FLAGS = $(ifeq $(MAKEFLAGS) "","",-$(MAKEFLAGS))

CACTUS_ROOT?=/opt/cactus
UIO_UHAL_PATH ?= $(CACTUS_ROOT)/../UIOuHAL/

MAKE_PATH=$(abspath ./BUTool)

# BUTool compile-time flag to specify to use the new StatusDisplay
# name parser for row and column names (defaults to False)
BUTOOL_SD_USE_NEW_PARSER ?= false

export MAKE_PATH
export CACTUS_ROOT
export UIO_UHAL_PATH
export BUTOOL_SD_USE_NEW_PARSER 
#FLAGS += CACTUS_ROOT=$(CACTUS_ROOT)
#FLAGS += UIO_UHAL_PATH=$(UIO_UHAL_PATH)

.PHONY: init git_remote_to_ssh git_remote_to_https                                                                                                                       

all: local
-include BUTool/mk/helpers.mk

cc: ${SYM_LINKS}
	$(MAKE) ${FLAGS} -C BUTool -f mk/Makefile.crosscompile

local: ${SYM_LINKS}
	$(MAKE) ${FLAGS} -C BUTool -f Makefile

init: 
	git submodule update --init --recursive
#        $(git remote -v | grep push | sed 's/https:\/\//git@/g' | sed 's/.com\//.com:/g' | awk '{print "git remote set-url --push " $1 " " $2}')

BUTool/%:%
	@ln -s ../../$< $@

links: ${SYM_LINKS}


install: 
	$(MAKE) install ${FLAGS} -C BUTool -f mk/Makefile

clean:
	@$(MAKE) ${FLAGS} -C BUTool -f Makefile clean
	@rm -rf ${SYM_LINKS}
