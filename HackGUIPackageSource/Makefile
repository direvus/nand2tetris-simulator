CFLAGS=-classpath ../InstallDir/bin/lib/Hack.jar
javafiles=$(shell find . -name '*.java')
classfiles=$(patsubst %.java,%.class,$(javafiles))


.PHONY: all build package


all: package


build: $(classfiles)


package: HackGUI.jar


%.class: %.java
	javac $(CFLAGS) $<


%.jar: $(classfiles)
	jar --create --file $@ $$(find . -name '*.class')
