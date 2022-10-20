TARGET = Grace
SRC = ${TARGET}.s
OBJ = ${SRC:.s=.o}
CC = nasm
CFLAGS = -f macho64
RM = rm -f
OUTPUT = ${TARGET}_kid.s

%.o: %.s
	${CC} ${CFLAGS} $< -o $@

${TARGET}: ${OBJ}
	gcc $< -o $@ -Wl,-no_pie

all: ${TARGET}

clean:
	${RM} ${OBJ}
	${RM} ${OUTPUT}

fclean: clean
	${RM} ${TARGET}

re: fclean all

.PHONY: all clean fclean re
