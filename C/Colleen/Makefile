TARGET = Colleen
SRC = ${TARGET}.c
OBJ = ${SRC:.c=.o}
CC = gcc
CFLAGS = -Wall -Wextra -Werror
RM = rm -f

%.o: %.c
	${CC} ${CFLAGS} -c $< -o $@

${TARGET}: ${OBJ}
	${CC} $< -o $@

all: ${TARGET}

clean:
	${RM} ${OBJ}

fclean: clean
	${RM} ${TARGET}

re: fclean all

.PHONY: all clean fclean re
