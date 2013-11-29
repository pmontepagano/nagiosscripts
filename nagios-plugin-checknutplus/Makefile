
#
# $Id: Makefile 9 2013-09-19 17:51:33Z chris $
#

APPNAME=nagios-plugin-checknutplus
VERSION=1.8

UPLOADURL=http://ftp.lihas.de/cgi-bin/newpackage
DEBIAN_FULL_NAME="LiHAS Stuttgart"
DEBIAN_EMAIL="support@lihas.de"
DEBIAN_HOMEPAGE="http://www.lihas.de/"

ARCH=all

##
## Typical Usage:
##   - create a directory named after the application,
##     it must be all  lowercase, digits  and dashes
##   - put a copy of this Makefile inside that directory
##   - fill in the variables on top of Makefile:
##     APPNAME=  the name of the application - same as the directory name
##     VERSION=  version of the application
##     
##     UPLOADURL=         url where the package is to be uploaded
##     DEBIAN_FULL_NAME=  name of the package maintainer
##     DEBIAN_EMAIL=      email of the package maintainer
##     DEBIAN_HOMEPAGE=   homepage of the software package
##   - run  make debian-prepkg  inside that directory
##   - add a description to debian/control
##   - add directories as needed
##   - add code
##   - update debian/changelog
##   - update Makefile VERSION
##   - make commit
##   - make debian-dpkg
##   - make debian-upload
##

CFGDIR=$(DESTDIR)/etc/$(APPNAME)
CFGDDIR=$(DESTDIR)/etc/$(APPNAME).d
CRONDFILES=$( etc/cron.d/* )
CRONHOURLYFILES=$( etc/cron.hourly/* )
CRONDAILYFILES=$( etc/cron.daily/* )
CRONWEEKLYFILES=$( etc/cron.weekly/* )
CRONMONTHLYFILES=$( etc/cron.monthly/* )
BINDIR=$(DESTDIR)/bin
SBINDIR=$(DESTDIR)/sbin
UBINDIR=$(DESTDIR)/usr/bin
USBINDIR=$(DESTDIR)/usr/sbin
ULBINDIR=$(DESTDIR)/usr/local/bin
ULSBINDIR=$(DESTDIR)/usr/local/sbin
ULIBDIR=$(DESTDIR)/usr/lib/$(APPNAME)
ULIBNAGIOSPLUGINSDIR=$(DESTDIR)/usr/lib/nagios/plugins
USHAREDIR=$(DESTDIR)/usr/share/$(APPNAME)
USDOCDIR=$(DESTDIR)/usr/share/doc/$(APPNAME)
MAN1DIR=$(DESTDIR)/usr/share/man/man1
MAN2DIR=$(DESTDIR)/usr/share/man/man2
MAN3DIR=$(DESTDIR)/usr/share/man/man3
MAN4DIR=$(DESTDIR)/usr/share/man/man4
MAN5DIR=$(DESTDIR)/usr/share/man/man5
MAN6DIR=$(DESTDIR)/usr/share/man/man6
MAN7DIR=$(DESTDIR)/usr/share/man/man7
MAN8DIR=$(DESTDIR)/usr/share/man/man8
RUNDIR=$(DESTDIR)/var/lib/$(APPNAME)

all:

install: 
	[ -e bin/$(APPNAME)         ] && make install-bin  || true
	[ -d bin     ] && [ `ls bin | wc -l` -gt 0    ] && make install-dir-bin  || true
	[ -e sbin/$(APPNAME)        ] && make install-sbin || true
	[ -d sbin    ] && [ `ls sbin | wc -l` -gt 0   ] && make install-dir-sbin || true
	[ -e ubin/$(APPNAME)        ] && make install-ubin || true
	[ -d ubin    ] && [ `ls ubin | wc -l` -gt 0   ] && make install-dir-ubin || true
	[ -e usbin/$(APPNAME)       ] && make install-usbin || true
	[ -d usbin   ] && [ `ls usbin | wc -l` -gt 0  ] && make install-dir-usbin || true
	[ -d ulbin   ] && [ `ls ulbin | wc -l` -gt 0  ] && make install-dir-ulbin || true
	[ -d ulsbin  ] && [ `ls ulsbin | wc -l` -gt 0 ] && make install-dir-ulsbin || true

	[ -d ulib    ] && [ `ls ulib | wc -l` -gt 0   ] && make install-dir-ulib || true
	[ -d ulnagiosplugins    ] && [ `ls ulnagiosplugins | wc -l` -gt 0   ] && make install-dir-ulnagiosplugins || true
	[ -d ushare  ] && [ `ls ushare | wc -l` -gt 0 ] && make install-dir-ushare || true
	[ -e docs/$(APPNAME).sgml   ] && make install-sgml || true
	[ -d docs    ] && [ `ls docs | wc -l` -gt 0   ] && make install-dir-sgml || true
	[ -e docs/$(APPNAME).html   ] && make install-html || true
	[ `find docs -name "*.1" | wc -l` -gt 0 ] && make install-man-sec MANSEC=1 || true
	[ `find docs -name "*.2" | wc -l` -gt 0 ] && make install-man-sec MANSEC=2 || true
	[ `find docs -name "*.3" | wc -l` -gt 0 ] && make install-man-sec MANSEC=3 || true
	[ `find docs -name "*.4" | wc -l` -gt 0 ] && make install-man-sec MANSEC=4 || true
	[ `find docs -name "*.5" | wc -l` -gt 0 ] && make install-man-sec MANSEC=5 || true
	[ `find docs -name "*.6" | wc -l` -gt 0 ] && make install-man-sec MANSEC=6 || true
	[ `find docs -name "*.7" | wc -l` -gt 0 ] && make install-man-sec MANSEC=7 || true
	[ `find docs -name "*.8" | wc -l` -gt 0 ] && make install-man-sec MANSEC=8 || true
	[ -e docs/copyright         ] && make install-copy || true
	[ -d docs    ] && [ `ls docs | wc -l` -gt 0   ] && make install-dir-usdoc || true
	[ -e etc/$(APPNAME).d       ] && make install-etcd || true
	[ -e etc/$(APPNAME)         ] && make install-etc  || true
	[ -e etc/init.d             ] && make install-etcinitd       || true
	[ -e etc/cron.d             ] && make install-etccrond       || true
	[ -e etc/cron.daily         ] && make install-etccrondaily   || true
	[ -e etc/cron.hourly        ] && make install-etccronhourly  || true
	[ -e etc/cron.weekly        ] && make install-etccronweekly  || true
	[ -e etc/cron.monthly       ] && make install-etccronmonthly || true

# install bin -> /bin
install-bin: bin/$(APPNAME)
	install -d $(BINDIR)
	install -m755 bin/$(APPNAME)        $(BINDIR)

# install sbin -> /sbin
install-sbin: sbin/$(APPNAME)
	install -d $(SBINDIR)
	install -m755 sbin/$(APPNAME)       $(SBINDIR)

# install ubin -> /usr/bin
install-ubin: ubin/$(APPNAME)
	install -d $(UBINDIR)
	install -m755 ubin/$(APPNAME)       $(UBINDIR)

# install usbin -> /usr/sbin
install-usbin: usbin/$(APPNAME)
	install -d $(USBINDIR)
	install -m755 usbin/$(APPNAME)      $(USBINDIR)

# install ulbin -> /usr/local/bin
install-ulbin: ulbin/$(APPNAME)
	install -d $(ULBINDIR)
	install -m755 ulbin/$(APPNAME)      $(ULBINDIR)

# install ulsbin -> /usr/local/sbin
install-ulsbin: ulsbin/$(APPNAME)
	install -d $(ULSBINDIR)
	install -m755 ulsbin/$(APPNAME)     $(ULSBINDIR)

install-sgml: docs/$(APPNAME).sgml
	make docs
	install -d $(USDOCDIR)
	install -m644 docs/$(APPNAME).sgml  $(USDOCDIR)

install-html: docs/$(APPNAME).html
	install -d $(USDOCDIR)
	install -m644 docs/$(APPNAME).html  $(USDOCDIR)

install-copy: docs/$(APPNAME).copy
	install -d $(USDOCDIR)
	install -m644 docs/$(APPNAME).copy  $(USDOCDIR)

install-man1: docs/$(APPNAME).1
	install -d $(MAN1DIR)
	install -m644 docs/$(APPNAME).1     $(MAN1DIR)

install-man2: docs/$(APPNAME).2
	install -d $(MAN2DIR)
	install -m644 docs/$(APPNAME).2     $(MAN2DIR)

install-man3: docs/$(APPNAME).3
	install -d $(MAN3DIR)
	install -m644 docs/$(APPNAME).3     $(MAN3DIR)

install-man4: docs/$(APPNAME).4
	install -d $(MAN4DIR)
	install -m644 docs/$(APPNAME).4     $(MAN4DIR)

install-man5: docs/$(APPNAME).5
	install -d $(MAN5DIR)
	install -m644 docs/$(APPNAME).5     $(MAN5DIR)

install-man6: docs/$(APPNAME).6
	install -d $(MAN6DIR)
	install -m644 docs/$(APPNAME).6     $(MAN6DIR)

install-man7: docs/$(APPNAME).7
	install -d $(MAN7DIR)
	install -m644 docs/$(APPNAME).7     $(MAN7DIR)

install-man8: docs/$(APPNAME).8
	install -d $(MAN8DIR)
	install -m644 docs/$(APPNAME).8     $(MAN8DIR)

install-man-sec:
	install -d $(MAN$(MANSEC)DIR)
	for i in docs/*.$(MANSEC) ; do [ -f $$i ] && install -m644 $$i $(MAN$(MANSEC)DIR) ; done

install-dir-bin: bin
	install -d -m755 $(BINDIR)
	for i in bin/* ; do [ -f $$i ] && install -m755 $$i $(BINDIR) ; done

install-dir-sbin: sbin
	install -d -m755 $(SBINDIR)
	for i in sbin/* ; do [ -f $$i ] && install -m755 $$i $(SBINDIR) ; done

install-dir-ubin: ubin
	install -d -m755 $(UBINDIR)
	for i in ubin/* ; do [ -f $$i ] && install -m755 $$i $(UBINDIR) ; done

install-dir-usbin: usbin
	install -d -m755 $(USBINDIR)
	for i in usbin/* ; do [ -f $$i ] && install -m755 $$i $(USBINDIR) ; done

install-dir-ulbin: ulbin
	install -d -m755 $(ULBINDIR)
	for i in ulbin/* ; do [ -f $$i ] && install -m755 $$i $(ULBINDIR) ; done

install-dir-ulsbin: ulsbin
	install -d -m755 $(ULSBINDIR)
	for i in ulsbin/* ; do [ -f $$i ] && install -m755 $$i $(ULSBINDIR) ; done

install-dir-ulib: ulib
	install -d -m755 $(ULIBDIR)
	for i in ulib/* ; do [ -f $$i ] && install -m755 $$i $(ULIBDIR) ; done

# install ulnagiosplugins -> /usr/lib/nagios/plugins
install-dir-ulnagiosplugins: ulnagiosplugins
	install -d -m755  $(ULIBNAGIOSPLUGINSDIR)
	for i in ulnagiosplugins/* ; do [ -f $$i ] && install -m755 $$i $(ULIBNAGIOSPLUGINSDIR) ; done

install-dir-ushare: ushare
	install -d -m755 $(USHAREDIR)
	for i in ushare/* ; do [ -f $$i ] && install -m755 $$i $(USHAREDIR) ; done

install-dir-usdoc:
	install -d -m755 $(USDOCDIR)
	##for i in docs/* ; do [ -f $$i ] && install -m755 $$i $(USDOCDIR) ; done
	for i in docs/* ; do case $$i in *.[1-9]|*.html|*.sgml|copyright);;*) [ -f $$i ] && install -m644 $$i $(USDOCDIR);;esac ; done

install-dir-sgml: 
	install -d -m755 $(USDOCDIR)
	##for i in docs/* ; do [ -f $$i ] && install -m755 $$i $(USDOCDIR) ; done
	for i in docs/*.sgml ; do [ -f $$i ] && install -m644 $$i $(USDOCDIR) ; done
	make docs

install-etc: etc/$(APPNAME) etc/$(APPNAME)/*
	install -d $(CFGDIR)
	install -m644 etc/$(APPNAME)/.placeholder $(CFGDIR)
	for i in etc/$(APPNAME)/* ; do [ -f $$i ] && install -m644 $$i $(CFGDIR) ; done

install-etcd: etc/$(APPNAME).d etc/$(APPNAME).d/*
	install -d $(CFGDDIR)
	install -m644 etc/$(APPNAME).d/.placeholder $(CFGDDIR)
	for i in etc/$(APPNAME).d/* ; do [ -f $$i ] && install -m644 $$i $(CFGDDIR) ; done

install-etcinitd: etc/init.d $(INITDFILES)
	install -d $(DESTDIR)/etc/init.d
	for i in etc/init.d/* ; do [ -f $$i ] && install -m644 $$i $(DESTDIR)/etc/init.d/ ; done

install-etccrond: etc/cron.d $(CRONDFILES)
	install -d $(DESTDIR)/etc/cron.d
	for i in etc/cron.d/* ; do [ -f $$i ] && install -m644 $$i $(DESTDIR)/etc/cron.d/ ; done

install-etccrondaily: etc/cron.daily $(CRONDAYLYFILES)
	install -d $(DESTDIR)/etc/cron.daily
	for i in etc/cron.daily/* ; do [ -f $$i ] && install -m755 $$i $(DESTDIR)/etc/cron.daily/ ; done

install-etccronhourly: etc/cron.hourly $(CRONHOURLYFILES)
	install -d $(DESTDIR)/etc/cron.hourly
	for i in etc/cron.hourly/* ; do [ -f $$i ] && install -m755 $$i $(DESTDIR)/etc/cron.hourly/ ; done

install-etccronweekly: etc/cron.weekly $(CRONWEEKLYFILES)
	install -d $(DESTDIR)/etc/cron.weekly
	for i in etc/cron.weekly/* ; do [ -f $$i ] && install -m755 $$i $(DESTDIR)/etc/cron.weekly/ ; done

install-etccronmonthly: etc/cron.monthly $(CRONMONTHLYFILES)
	install -d $(DESTDIR)/etc/cron.monthly
	for i in etc/cron.monthly/* ; do [ -f $$i ] && install -m755 $$i $(DESTDIR)/etc/cron.monthly/ ; done

clean:

#old# docs:  docs/$(APPNAME).sgml docs/$(APPNAME).html docs/$(APPNAME).1
#old# docs/$(APPNAME).html: docs/$(APPNAME).sgml
#old# 	docbook2html docs/$(APPNAME).sgml --output docs
#old# 	mv docs/index.html docs/$(APPNAME).html
#old# 	echo >> docs/$(APPNAME).html
#old# 
#old# docs/$(APPNAME).1: docs/$(APPNAME).sgml
#old# 	docbook2man docs/$(APPNAME).sgml --output docs
#old# 	[ -f docs/$(APPNAME).SECTION ] && mv docs/$(APPNAME).SECTION docs/$(APPNAME).1 || true
#old# 	# gzip -9 docs/docs/$(APPNAME).1
#old# 	rm -f docs/manpage.links docs/manpage.refs
#old# docs:  docs/*.sgml docs/*.html docs/*.[1-8]

####################################### MAN ################################

# MANPAGES1 is default and set up automatically,
# others go here:
MANPAGES2 := 
MANPAGES3 := 
MANPAGES4 := 
MANPAGES5 := 
MANPAGES6 := 
MANPAGES7 := 
MANPAGES8 := 

# add path prefixes
MANPAGES2 := $(addprefix docs/, $(MANPAGES2))
MANPAGES3 := $(addprefix docs/, $(MANPAGES3))
MANPAGES4 := $(addprefix docs/, $(MANPAGES4))
MANPAGES5 := $(addprefix docs/, $(MANPAGES5))
MANPAGES6 := $(addprefix docs/, $(MANPAGES6))
MANPAGES7 := $(addprefix docs/, $(MANPAGES7))
MANPAGES8 := $(addprefix docs/, $(MANPAGES8))
# build exclusion list for .1 
MANPAGES28 := $(MANPAGES2:.2=.1) $(MANPAGES3:.3=.1) $(MANPAGES4:.4=.1) $(MANPAGES5:.5=.1) $(MANPAGES6:.6=.1) $(MANPAGES7:.7=.1) $(MANPAGES8:.8=.1)

SGMLDOCS := $(wildcard docs/*.sgml)
HTMLDOCS := $(patsubst %.sgml,%.html,$(SGMLDOCS))
MANPAGESA := $(patsubst %.sgml,%.1,$(SGMLDOCS))
MANPAGES1 := $(filter-out $(MANPAGES28),$(MANPAGESA) )

MANPAGES := $(MANPAGES1) $(MANPAGES2) $(MANPAGES3) $(MANPAGES4) $(MANPAGES5) $(MANPAGES6) $(MANPAGES7) $(MANPAGES8)

docs: $(MANPAGES) $(HTMLDOCS)

# create .html from .sgml
docs/%.html: docs/%.sgml
	docbook2html $< --output docs/
	ls -l docs/*.html
	mv docs/index.html $@
	# append a newline:
	echo >> $@

$(addprefix docs/%., 1 2 3 4 5 6 7 8): docs/%.sgml
	@echo "M:" $(MANPAGES)
	docbook2man $< --output docs/
	# mv docs/$*.SECTION $@
	rm -f docs/manpage.links docs/manpage.refs

install-man:
	make install-man1
	make install-man2
	make install-man3
	make install-man4
	make install-man5
	make install-man6
	make install-man7
	make install-man8

####################################### /MAN ################################

commit:
	svn ci -m 'update file content'

debian-dpkg: 
	dpkg-buildpackage -sa -rfakeroot -tc

debian-prepkg: 
	echo | DEBFULLNAME=$(DEBIAN_FULL_NAME) dh_make -s --native -e $(DEBIAN_EMAIL) -p $(APPNAME)_1.0
	sed -i 's#^Homepage:.*#Homepage: $(DEBIAN_HOMEPAGE)#;s#^Architecture:.*#Architecture: all#;/^#/d;s#^Description:.*#Description: '"${SHORT_DESC:-SHORT_DESC}"'#;s#^ <insert long description, indented with spaces># '"${LONG_DESC:-LONG_DESC}"'#;' debian/control
	#cp etc/$(APPNAME).crontab debian/cron.d
	echo -n > debian/conffiles
	[ -d etc/$(APPNAME) ] && echo etc/$(APPNAME)/.placeholder >> debian/conffiles || true
	for i in etc/$(APPNAME)/* ; do [ -f $$i ] && echo $$i ; done >> debian/conffiles || true
	[ -d etc/$(APPNAME).d ] && echo etc/$(APPNAME).d/.placeholder >> debian/conffiles || true
	for i in etc/$(APPNAME).d/* ; do [ -f $$i ] && echo $$i ; done >> debian/conffiles || true
	for i in etc/* ; do [ -f $$i ] && echo $$i ; done >> debian/conffiles || true
	for i in etc/cron.d/* ; do [ -f $$i ] && echo $$i ; done >> debian/conffiles || true
	for i in etc/cron.hourly/* ; do [ -f $$i ] && echo $$i ; done >> debian/conffiles || true
	for i in etc/cron.daily/* ; do [ -f $$i ] && echo $$i ; done >> debian/conffiles || true
	for i in etc/cron.weekly/* ; do [ -f $$i ] && echo $$i ; done >> debian/conffiles || true
	for i in etc/cron.monthly/* ; do [ -f $$i ] && echo $$i ; done >> debian/conffiles || true
	[ -f $(CFGDIR)/$(APPNAME).hosts ] && echo $(CFGDIR)/$(APPNAME).hosts >> debian/conffiles || true
	rm -rf debian/README.src debian/README.source
	rm -rf debian/cron.d.ex debian/init.d.ex debian/menu.ex
	rm -rf debian/manpage.sgml.ex debian/cron.d.ex
	rm -rf debian/emacsen-remove.ex debian/manpage.1.ex prerm.ex
	rm -rf debian/emacsen-install.ex debian/emacsen-startup.ex
	rm -rf debian/preinst.ex debian/watch.ex debian/conffiles.ex
	rm -rf debian/postinst.ex debian/postrm.ex debian/prerm.ex
	rm -rf debian/*.EX debian/*.ex
	svn add debian Makefile

debian-upload: 
	# write login:password to ~/.debianrepositoryauth
	curl -u `cat $(HOME)/.debianrepositoryauth` -v $(UPLOADURL) -F B1="upload file" -F uploaded_file=@../$(APPNAME)_$(VERSION)_$(ARCH).deb
