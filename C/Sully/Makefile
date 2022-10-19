TARGET = Sully
SRC = ${TARGET}.c
OBJ = ${SRC:.c=.o}
CC = gcc
CFLAGS = -Wall -Wextra -Werror -g
RM = rm -f

%.o: %.c
	${CC} ${CFLAGS} -c $< -o $@

${TARGET}: ${OBJ}
	${CC} $< -o $@

# test: ${TARGET}
# ./${TARGET} && diff -u ${SRC} ${OUTPUT}

all: ${TARGET}

clean:
	${RM} ${OBJ}
	${RM} ${TARGET}_*

fclean: clean
	${RM} ${TARGET}

re: fclean all

.PHONY: all clean fclean re
