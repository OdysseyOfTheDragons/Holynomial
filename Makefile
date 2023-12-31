# Compiler
CC=gcc

# Flags
FLAGS=-Wall -Wextra -pedantic -fsanitize=address \
	  -I. -g \
	  -fstack-protector-all -fstack-protector-strong -fstack-clash-protection \
	  -Wformat=2 -Werror=implicit-function-declaration \
	  -Wshadow -Wdouble-promotion \
	  -fno-common -ffunction-sections -fdata-sections \
	  # -Os -s -O3
EFLAGS=-lm

# Sources
MAIN=main.c
CSRC=cli/colors/colors.c \
	cli/options/options.c \
	cli/parser/parser.c \
	cli/strings/strings.c \
	maths/maths.c \
	polynomials/polynomials.c \
	store/store.c
OSRC=$(CSRC:.c=.o) $(MAIN:.c=.o)
DSRC=$(CSRC:.c=.d) $(MAIN:.c=.d)
HSRC=$(CSRC:.c=.h)
SRC=$(MAIN) $(CSRC)

.PHONY: all
all: format build/holypoly run
	
# File compilation
build/holypoly: $(OSRC)
	@$(CC) $(FLAGS) -o $@ $+ $(EFLAGS)

%.o: %.c
	@$(CC) $(FLAGS) -o $@ -c $< $(EFLAGS)

%.d: %.c
	@$(CC) $(FLAGS) -MM -MD -o $@ $<

run:
	@./build/holypoly

format: $(CSRC) $(HSRC)
	@indent -linux $^

.PHONY: clean
clean:
	@rm -f main $(OSRC) $(DSRC) *.i *.s

.PHONY: archive
archive: format
	@-tar -zcf main.tar.gz Makefile docs/ $(SRC) $(HSRC)

# Automatic dependences
-include $(DSRC)
