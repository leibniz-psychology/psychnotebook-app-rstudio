PREFIX:=/usr/local
RSTUDIO_PREFIX:=/usr/local

# guix patches desktop files itself
install: startrstudio org.psychnotebook.rstudio.desktop
	install -d $(PREFIX)/bin $(PREFIX)/share/applications $(PREFIX)/share/icons/hicolor/scalable/apps
	install -m 755 startrstudio $(PREFIX)/bin/
	install -m 644 -D org.psychnotebook.rstudio.desktop $(PREFIX)/share/applications/
	install -m 644 -D rstudio.svg $(PREFIX)/share/icons/hicolor/scalable/apps/

startrstudio: startrstudio.in
	m4 -DRSTUDIO_PREFIX=$(RSTUDIO_PREFIX) < $< > $@

