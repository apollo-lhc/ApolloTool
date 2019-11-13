LIBRARY_EXCEPTION_SOURCES  = 
LIBRARY_EXCEPTION_OBJECT_FILES = 

PLUGINS= $(wildcard plugins/*)
SYM_LINKS=$(patsubst %,BUTool/%,${PLUGINS})

FLAGS = $(ifeq $(MAKEFLAGS) "","",-$(MAKEFLAGS))

all: ${SYM_LINKS}
	$(MAKE) ${FLAGS} -C BUTool -f make/Makefile.zynq

BUTool/%:%
	@ln -s ../../$< $@

clean:
	@make -C BUTool -f make/Makefile.zynq clean
	@rm -rf ${SYM_LINKS}
