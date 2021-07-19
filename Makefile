NAME=draft-muffett-end-to-end-secure-messaging-04
PREV=draft-muffett-end-to-end-secure-messaging-03
DIFF=vs-03
DIR=text
XML2RFC=xml2rfc -v
#--v3

all: $(DIR)/$(NAME).txt $(DIR)/$(NAME).html
	-diff -bc $(DIR)/$(PREV).txt $(DIR)/$(NAME).txt > $(DIR)/$(NAME)-$(DIFF).diff

diff: all
	cat $(DIR)/$(NAME)-$(DIFF).diff

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
