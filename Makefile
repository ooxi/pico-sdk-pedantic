.PHONY: all
all:	rebuild-c	\
	rebuild-c++


.PHONY: rebuild-c
rebuild-c:
	@if [ -d 'build-blink.c' ]; then	\
		rm -rf 'build-blink.c';		\
	fi

	(mkdir 'build-blink.c' && cd 'build-blink.c' && cmake '../blink.c' && make)


.PHONY: rebuild-c++
rebuild-c++:
	@if [ -d 'build-blink.c++' ]; then	\
		rm -rf 'blink.c++';		\
	fi

	(mkdir 'build-blink.c++' && cd 'build-blink.c++' && cmake '../blink.c++' && make)

