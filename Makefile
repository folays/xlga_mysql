NAME	= mysql.so

LUA_CFLAGS	!= pkg-config --cflags lua5.2
LUA_LIBS	!= pkg-config --libs lua5.2

MYSQLCFG	!= echo `which mysql_config`
MYSQL_CFLAGS	!= echo `$(MYSQLCFG) --include`
MYSQL_LIBS	!= echo `$(MYSQLCFG) --libs`

CFLAGS		= $(LUA_CFLAGS) $(MYSQL_CFLAGS)

LIBS		= $(LUA_LIBS) $(MYSQL_LIBS)

###
CFLAGS	+= -fPIC

CC	= gcc
RM	= rm -f

SRC!=ls *.c
OBJ=$(SRC:.c=.o)

all	: $(NAME)

re	: fclean all

$(NAME)	: $(OBJ)
	$(CC) -o $(NAME) -shared $(OBJ) $(LIBS)

clean	:
	-$(RM) $(OBJ) *~

fclean	: clean
	-$(RM) $(NAME)
