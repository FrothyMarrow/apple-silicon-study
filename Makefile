LDLIBS = -lSystem
ASM_SRCS = $(wildcard **/*.asm)
OBJS = $(ASM_SRCS:.asm=.o)
OUTS = $(ASM_SRCS:.asm=.out)

.PHONY: all clean

all: $(OUTS)

%.out: %.o
	ld $(LDLIBS) -o $@ $^

%.o: %.asm
	as -o $@ $<

clean:
	rm -f $(OBJS) $(OUTS)
