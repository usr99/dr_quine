TARGET = Sully
SRC = ${TARGET}.s
OBJ = ${SRC:.s=.o}
CC = nasm
CFLAGS = -f macho64
RM = rm -f

%.o: %.s
	${CC} ${CFLAGS} $< -o $@

${TARGET}: ${OBJ}
	gcc $< -o $@ -Wl,-no_pie

all: ${TARGET}

clean:
	${RM} ${OBJ}
	${RM} ${TARGET}_*

fclean: clean
	${RM} ${TARGET}

re: fclean all

.PHONY: all clean fclean re
