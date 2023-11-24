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
SRC=main.c \
	cli/colors/colors.c \
	cli/options/options.c \
	cli/parser/parser.c \
	cli/strings/strings.c \
	maths/maths.c \
	polynomials/polynomials.c \
	store/store.c
OSRC=$(SRC:.c=.o)
DSRC=$(SRC:.c=.d)

.PHONY: all
all: build/holypoly run
	
# File compilation
build/holypoly: $(OSRC)
	@$(CC) $(FLAGS) -o $@ $+ $(EFLAGS)

%.o: %.c
	@$(CC) $(FLAGS) -o $@ -c $< $(EFLAGS)

%.d: %.c
	@$(CC) $(FLAGS) -MM -MD -o $@ $<

run:
	./build/holypoly

.PHONY: clean
clean:
	@rm -f main $(OSRC) $(DSRC) *.i *.s

.PHONY: archive
archive:
	@-tar -zvf main.tar.gz Makefile **/*.[ch]

# Automatic dependences
-include $(DSRC)
