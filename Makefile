PREFIX ?= /usr

all:
		@echo RUN \'make install\' to install fetchme

install:
		@install -Dm755 fetchme-easy.sh $(DESTDIR)$(PREFIX)/bin/fetchme

uninstall:
		@rm -f $(DESTDIR)$(PREFIX)/bin/fetchme
