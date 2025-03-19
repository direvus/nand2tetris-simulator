javafiles=$(shell find . -name '*.java')
classfiles=$(patsubst %.java,%.class,$(javafiles))


.PHONY: all build package


all: package


build: $(classfiles)


package: Hack.jar


%.class: %.java
	javac $<


%.jar: $(classfiles)
	jar --create --file $@ $$(find . -name '*.class')
