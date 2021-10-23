##
## EPITECH PROJECT, 2021
## EvalExpr
## File description:
## Makefile
##

NAME		=	funEvalExpr

all			:	$(NAME)

$(NAME)		:
				stack build
				mv $(shell stack path --local-install-root)/bin/$(NAME)-exe ./$(NAME)

tests_run	:
				stack test

clean		:
				$(RM) $(NAME)

fclean		:	clean
				stack clean

re			:	fclean all

tests_run	:
				stack build --test

.PHONY		:	all clean fclean re tests_run
