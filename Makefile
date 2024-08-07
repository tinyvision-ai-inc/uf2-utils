CFLAGS = -Wall -Wextra -std=gnu99 -pedantic -D_XOPEN_SOURCE=700
PREFIX = /usr/local
LDFLAGS =

BIN = bin2uf2 uf22bin uf2dump
SRC = libuf2.c
OBJ = $(SRC:.c=.o)

all: $(BIN)

install: $(BIN)
	cp $(BIN) $(PREFIX)/bin

clean:
	rm -f $(OBJ) $(BIN)

bin2uf2: bin2uf2.o
uf22bin: uf22bin.o
uf2dump: uf2dump.o

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) $@.o -o $@

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@
