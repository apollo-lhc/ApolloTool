LIBRARY_EXCEPTION_SOURCES  = 
LIBRARY_EXCEPTION_OBJECT_FILES = 

PLUGINS= $(wildcard plugins/*)
SYM_LINKS=$(patsubst %,BUTool/%,${PLUGINS})

all: ${SYM_LINKS}
	make -C BUTool -f make/Makefile.zynq

%:BUTool/%
	ln -s $@ $<
