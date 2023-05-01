# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lbusi <lbusi@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/18 16:22:50 by lbusi             #+#    #+#              #
#    Updated: 2023/05/01 15:46:47 by lbusi            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME		= minishell
CC			= gcc -g
CFLAGS		= -Wall -Wextra -Werror
RM			= rm -rf
INCLUDE		= minishell.h
READLINE	= -lreadline -L$(HOME)/.brew/opt/readline/lib -I$(HOME)/.brew/opt/readline/include
SRCS		= main.c builtins.c ft_strtrim_all.c exec.c		 	\
			  fill_node.c get_params.c ft_cmdtrim.c			 	\
			  expand.c heredoc.c error.c env.c custom_cmd.c	 	\
			  get_next_line.c get_next_line_utils.c prompt.c	\
			  ft_cmdsubsplit.c signal.c parse_args.c get_cmd.c  \
			  ft_free_matrix.c   \
			  ft_dup_matrix.c ft_extend_matrix.c ft_countchar.c 
				
OBJS		= ${SRCS:.c=.o}

%.o: %.c
	 $(CC) $(CFLAGS) -g -c $< -o ${<:.c=.o}

$(NAME): $(OBJS)
	@make -C ./libft
	$(CC) $(CFLAGS) -I $(INCLUDE) $(OBJS) -o $@ $(READLINE) libft/bin/libft.a

all: $(NAME)

clean:
	@$(RM) $(OBJS)

fclean: clean
	@make -C ./libft fclean
	@$(RM) $(NAME)

re: fclean all

leaks: all
	@leaks --atExit -- ./$(NAME)

.PHONY: all clean fclean re $(NAME)