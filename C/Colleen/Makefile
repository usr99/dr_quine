TARGET = Colleen
SRC = ${TARGET}.c
OBJ = ${SRC:.c=.o}
CC = gcc
CFLAGS = -Wall -Wextra -Werror
RM = rm -f
OUTPUT = tmp

%.o: %.c
	${CC} ${CFLAGS} -c $< -o $@

${TARGET}: ${OBJ}
	${CC} $< -o $@

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
