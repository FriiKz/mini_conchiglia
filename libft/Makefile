# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lbusi <lbusi@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/07 10:28:33 by aperez-b          #+#    #+#              #
#    Updated: 2023/05/01 15:49:43 by lbusi            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL=/bin/bash
UNAME = $(shell uname -s)
PRINTF = echo
ifeq ($(UNAME), Linux)
	PRINTF = echo -e
endif

# Make variables
PRINTF = printf
CC = gcc -MD
CFLAGS = -Wall -Wextra -Werror
AR = ar rcs
RM = rm -f
HEADER = libft.h
SRC_DIR = src
SRCB_DIR = srcb
SRCA_DIR = srca
OBJ_DIR = obj
OBJB_DIR = objb
OBJA_DIR = obja
BIN_DIR = bin
BIN = libft.a
NAME = $(BIN_DIR)/$(BIN)

SRC =	ft_atoi.c ft_bzero.c	\
	ft_calloc.c ft_putendl_fd.c		\
	ft_itoa.c ft_putchar_fd.c		\
	ft_putstr_fd.c ft_memccpy.c		\
	ft_memchr.c ft_memcmp.c			\
	ft_memcpy.c ft_isalnum.c		\
	ft_isalpha.c ft_isascii.c		\
	ft_isdigit.c ft_isprint.c		\
	ft_memmove.c ft_memset.c		\
	ft_split.c ft_strchr.c			\
	ft_strdup.c ft_strjoin.c		\
	ft_strlcat.c ft_strlcpy.c		\
	ft_strlen.c ft_strmapi.c		\
	ft_strncmp.c ft_strnstr.c		\
	ft_strrchr.c ft_strtrim.c		\
	ft_substr.c ft_tolower.c		\
	ft_toupper.c ft_putnbr_fd.c

SRCB = ft_lstadd_back.c	\
	ft_lstadd_front.c	\
	ft_lstclear.c		\
	ft_lstdelone.c		\
	ft_lstiter.c		\
	ft_lstlast.c		\
	ft_lstsize.c		\
	ft_lstnew.c			\
	ft_lstmap.c			\
	ft_lstget_at.c

SRCA = ft_putnbr_base_fd.c ft_putstrn_fd.c		\
	ft_putnchar_fd.c ft_isspace.c ft_uitoa.c	\
	ft_nbrlen.c ft_strrncmp.c ft_countchar.c	\
	ft_strenlarge.c ft_recursive_power.c		\
	ft_chartostr.c ft_sqrt.c ft_newvector.c		\
	ft_euclideandistance.c  ft_atoi2.c			\
	ft_free_matrix.c ft_dup_matrix.c			\
	ft_strchr_i.c ft_putmatrix_fd.c				\
	ft_matrixlen.c ft_strchars_i.c				\
	ft_between_chars.c ft_subsplit.c			\
	ft_extend_matrix.c ft_matrixtolst.c			\
	ft_lsttomatrix.c ft_matrix_replace_in.c

OBJ = $(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))

OBJB = $(addprefix $(OBJB_DIR)/, $(SRCB:.c=.o))

OBJA = $(addprefix $(OBJA_DIR)/, $(SRCA:.c=.o))

# Progress vars
SRC_COUNT_TOT := $(shell expr $(shell echo -n $(SRC) | wc -w) - $(shell ls -l $(OBJ_DIR) 2>&1 | grep ".o" | wc -l) + 1)
ifeq ($(shell test $(SRC_COUNT_TOT) -lt 0; echo $$?),0)
	SRC_COUNT_TOT := $(shell echo -n $(SRC) | wc -w)
endif
SRC_COUNT := 0
SRC_PCT = $(shell expr 100 \* $(SRC_COUNT) / $(SRC_COUNT_TOT))
SRCB_COUNT_TOT := $(shell expr $(shell echo -n $(SRCB) | wc -w) - $(shell ls -l $(OBJB_DIR) 2>&1 | grep ".o" | wc -l) + 1)
ifeq ($(shell test $(SRCB_COUNT_TOT) -lt 0; echo $$?),0)
	SRCB_COUNT_TOT := $(shell echo -n $(SRCB) | wc -w)
endif
SRCB_COUNT := 0
SRCB_PCT = $(shell expr 100 \* $(SRCB_COUNT) / $(SRCB_COUNT_TOT))
SRCA_COUNT_TOT := $(shell expr $(shell echo -n $(SRCA) | wc -w) - $(shell ls -l $(OBJA_DIR) 2>&1 | grep ".o" | wc -l) + 1)
ifeq ($(shell test $(SRCA_COUNT_TOT) -lt 0; echo $$?),0)
	SRCA_COUNT_TOT := $(shell echo -n $(SRCA) | wc -w)
endif
SRCA_COUNT := 0
SRCA_PCT = $(shell expr 100 \* $(SRCA_COUNT) / $(SRCA_COUNT_TOT))

all: $(NAME)

$(NAME): $(OBJ) $(OBJB) $(OBJA) | $(BIN_DIR)
	@$(AR) $(NAME) $^

bonus: $(OBJB) | $(BIN_DIR)
	@$(AR) $(NAME) $^

additional: $(OBJA) | $(BIN_DIR)
	@$(AR) $(NAME) $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJB_DIR)/%.o: $(SRCB_DIR)/%.c | $(OBJB_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJA_DIR)/%.o: $(SRCA_DIR)/%.c | $(OBJA_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(OBJB_DIR):
	@mkdir -p $(OBJB_DIR)

$(OBJA_DIR):
	@mkdir -p $(OBJA_DIR)

$(BIN_DIR):
	@mkdir -p $(BIN_DIR)

clean:
	@$(RM) -r $(OBJ_DIR)
	@$(RM) -r $(OBJB_DIR)
	@$(RM) -r $(OBJA_DIR)

fclean: clean
	@$(RM) -r $(BIN_DIR)

re: fclean
	@make all

-include $(OBJ_DIR)/*.d
-include $(OBJB_DIR)/*.d
-include $(OBJA_DIR)/*.d

.PHONY: all bonus additional clean fclean re 
