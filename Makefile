NAME = libftprintf
CFLAGS = -Wall -Wextra -Werror
OBJS = $(SOURCES:.c=.o)
SRCDIR = ./
INCDIR = ./ft_printf.h
FILES = ft_printf.c char.c hexlower.c hexupper.c integer.c output_handler.c percent.c pointer.c string.c unsigned.c utils.c
SOURCES = $(addprefix $(SRCDIR), $(FILES))

# Compile .c files to .o object files
$(SRCDIR)%.o: $(SRCDIR)%.c
	$(CC) $(CFLAGS) -I $(INCDIR) -c $< -o $@

all: $(NAME)

# Create the static library
$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o $(NAME) $(OBJS)

# Remove object files
clean:
	$(RM) $(OBJS)

# Remove object files and the library
fclean: clean
	$(RM) $(NAME)

# Rebuild everything
re: fclean all

.PHONY: all clean fclean re