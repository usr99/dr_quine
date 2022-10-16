TARGET = Colleen
SRC = ${TARGET}.s
OBJ = ${SRC:.s=.o}
CC = nasm
CFLAGS = -f macho64
RM = rm -f
OUTPUT = tmp

%.o: %.s
	${CC} ${CFLAGS} $< -o $@

${TARGET}: ${OBJ}
	gcc $< -o $@

test: ${TARGET}
	./${TARGET} > ${OUTPUT} && diff -u ${OUTPUT} ${SRC}

all: ${TARGET}

clean:
	${RM} ${OBJ}
	${RM} ${OUTPUT}

fclean: clean
	${RM} ${TARGET}

re: fclean all

.PHONY: all clean fclean re
