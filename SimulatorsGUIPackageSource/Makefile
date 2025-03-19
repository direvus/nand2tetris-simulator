LIBDIR=../InstallDir/bin/lib
CFLAGS=-classpath .:$(LIBDIR)/Hack.jar:$(LIBDIR)/HackGUI.jar:$(LIBDIR)/Compilers.jar:$(LIBDIR)/Simulators.jar
javafiles=$(shell find . -name '*.java')
classfiles=$(patsubst %.java,%.class,$(javafiles))


.PHONY: all build package


all: package


build: $(classfiles)


package: SimulatorsGUI.jar


%.class: %.java
	javac $(CFLAGS) $<


%.jar: $(classfiles)
	jar --create --file $@ $$(find . -name '*.class')
