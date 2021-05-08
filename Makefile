NAME=draft-muffett-end-to-end-secure-messaging-01
PREV=draft-muffett-end-to-end-secure-messaging-00
DIR=text
XML2RFC=xml2rfc -v
#--v3

all: $(DIR)/$(NAME).txt $(DIR)/$(NAME).html
	-diff -bc $(DIR)/$(PREV).txt $(DIR)/$(NAME).txt > $(DIR)/$(NAME).diff

push: all
	git add . && git commit -m "make on `datestamp`" && git push

open: all
	open $(DIR)/$(NAME).html

$(DIR)/$(NAME).html: $(DIR)/$(NAME).xml
	( cd $(DIR) && $(XML2RFC) --html $(NAME).xml )

$(DIR)/$(NAME).txt: $(DIR)/$(NAME).xml
	( cd $(DIR) && $(XML2RFC) --text $(NAME).xml )

$(DIR)/$(NAME).xml: $(NAME).md
	mmark -markdown $(NAME).md >$(DIR)/$(NAME).basic.md
	mmark -html $(NAME).md >$(DIR)/$(NAME).basic.html
	mmark $(NAME).md >$(DIR)/$(NAME).xml

clean:
	-rm -f *~
	-rm $(DIR)/$(NAME).*
