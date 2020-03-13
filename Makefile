LIBRARY_EXCEPTION_SOURCES  = 
LIBRARY_EXCEPTION_OBJECT_FILES = 

PLUGINS= $(wildcard plugins/*)
SYM_LINKS=$(patsubst %,BUTool/%,${PLUGINS})

FLAGS = $(ifeq $(MAKEFLAGS) "","",-$(MAKEFLAGS))


all: local

cc: ${SYM_LINKS}
	$(MAKE) ${FLAGS} -C BUTool -f make/Makefile.zynq

local: ${SYM_LINKS}
	$(MAKE) ${FLAGS} -C BUTool -f make/Makefile.x86

init: 
	git submodule update --init --recursive

BUTool/%:%
	@ln -s ../../$< $@

install: 
	$(MAKE) install ${FLAGS} -C BUTool -f make/Makefile.x86

clean:
	@make -C BUTool -f make/Makefile.zynq clean
	@rm -rf ${SYM_LINKS}
