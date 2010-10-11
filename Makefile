
PREFIX=/usr
SBINDIR=${PREFIX}/sbin
BINDIR=${PREFIX}/bin

DESTDIR=

SHELLS=bee bee-init bee-check bee-remove bee-install bee-list beesh
PERLS=beefind.pl
PROGRAMS=beeversion beesep

all: build

build: shells perls programs

perls: $(PERLS)

programs: $(PROGRAMS)

shells: $(SHELLS)

beesep: src/beesep/beesep.c
	gcc -Wall -o beesep src/beesep/beesep.c

beeversion: src/beeversion/beeversion.c
	gcc -Wall -o beeversion src/beeversion/beeversion.c

bee: src/bee.sh
	cp src/bee.sh        bee

bee-init: src/beeinit.sh
	cp src/beeinit.sh    bee-init

bee-check: src/beecheck.sh
	cp src/beecheck.sh   bee-check

bee-remove: src/beeremove.sh
	cp src/beeremove.sh  bee-remove

bee-install: src/beeinstall.sh
	cp src/beeinstall.sh bee-install

bee-list: src/beelist.sh
	cp src/beelist.sh bee-list

beesh: src/beesh.sh
	cp src/beesh.sh      beesh
	

beefind.pl: src/beefind.pl
	cp src/beefind.pl    beefind.pl

clean:
	rm -f $(SHELLS)
	rm -f $(PERLS)
	rm -f $(PROGRAMS)
	

install: build
	@mkdir -vp ${DESTDIR}${BINDIR}
	@for i in $(SHELLS) $(PERLS) $(PROGRAMS) ; do \
	     echo "installing $(DESTDIR)$(BINDIR)/$${i}" ; \
	     install -m 0755 $${i} ${DESTDIR}${BINDIR} ; \
	 done
