SLUG=draft-muffett-end-to-end-secure-messaging
THIS=04
PREV=03
DIR=text
SLUGTHIS=$(SLUG)-$(THIS)
SLUGPREV=$(SLUG)-$(PREV)
SLUGDIFF=$(SLUGTHIS)-vs-$(PREV)
XML2RFC=xml2rfc -v
#--v3
REPO=https://github.com/alecmuffett/draft-muffett-end-to-end-secure-messaging
OPEN=open -g

all: $(DIR)/$(SLUGTHIS).txt $(DIR)/$(SLUGTHIS).html
	-diff -bc $(DIR)/$(SLUGPREV).txt $(DIR)/$(SLUGTHIS).txt > $(DIR)/$(SLUGDIFF).diff

diff: all
	cat $(DIR)/$(SLUGDIFF).diff

push: all
	git add . && git commit -m "make on `datestamp`" && git push
	$(OPEN) $(REPO)

open: all
	$(OPEN) $(DIR)/$(SLUGTHIS).html

$(DIR)/$(SLUGTHIS).html: $(DIR)/$(SLUGTHIS).xml
	( cd $(DIR) && $(XML2RFC) --html $(SLUGTHIS).xml )

$(DIR)/$(SLUGTHIS).txt: $(DIR)/$(SLUGTHIS).xml
	( cd $(DIR) && $(XML2RFC) --text $(SLUGTHIS).xml )

$(DIR)/$(SLUGTHIS).xml: $(SLUGTHIS).md
	mmark -markdown $(SLUGTHIS).md >$(DIR)/$(SLUGTHIS).basic.md
	mmark -html $(SLUGTHIS).md >$(DIR)/$(SLUGTHIS).basic.html
	mmark $(SLUGTHIS).md >$(DIR)/$(SLUGTHIS).xml

clean:
	-rm -f *~
	-rm $(DIR)/$(SLUGTHIS).*
