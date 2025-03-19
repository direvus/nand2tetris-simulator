INSTALLDIR=InstallDir
LIBDIR=$(INSTALLDIR)/bin/lib
CHIPDIR=$(INSTALLDIR)/builtInChips
CLASSPATH=$(INSTALLDIR):$(LIBDIR)/Hack.jar:$(LIBDIR)/HackGUI.jar:$(LIBDIR)/Compilers.jar:$(LIBDIR)/Simulators.jar:$(LIBDIR)/SimulatorsGUI.jar
chipjavafiles=$(wildcard BuiltInChipsSource/*.java)
chipclassfiles=$(subst BuiltInChipsSource,$(CHIPDIR),$(chipjavafiles:%.java=%.class))
libs=$(LIBDIR)/Hack.jar $(LIBDIR)/HackGUI.jar $(LIBDIR)/Compilers.jar $(LIBDIR)/Simulators.jar $(LIBDIR)/SimulatorsGUI.jar


.PHONY: all chips


all: $(libs)


chips: $(chipclassfiles)


$(LIBDIR) $(CHIPDIR):
	mkdir -p $@


HackPackageSource/Hack.jar:
	cd HackPackageSource && make


HackGUIPackageSource/HackGUI.jar: $(LIBDIR)/Hack.jar
	cd HackGUIPackageSource && make


CompilersPackageSource/Compilers.jar: $(LIBDIR)/Hack.jar
	cd CompilersPackageSource && make


SimulatorsPackageSource/Simulators.jar: $(LIBDIR)/Hack.jar $(LIBDIR)/Compilers.jar
	cd SimulatorsPackageSource && make


SimulatorsGUIPackageSource/SimulatorsGUI.jar: $(LIBDIR)/Hack.jar $(LIBDIR)/HackGUI.jar $(LIBDIR)/Compilers.jar $(LIBDIR)/Simulators.jar
	cd SimulatorsGUIPackageSource && make


$(LIBDIR)/Hack.jar: HackPackageSource/Hack.jar $(LIBDIR)
	cp $< $@


$(LIBDIR)/HackGUI.jar: HackGUIPackageSource/HackGUI.jar $(LIBDIR)
	cp $< $@


$(LIBDIR)/Compilers.jar: CompilersPackageSource/Compilers.jar $(LIBDIR)
	cp $< $@


$(LIBDIR)/Simulators.jar: SimulatorsPackageSource/Simulators.jar $(LIBDIR)
	cp $< $@


$(LIBDIR)/SimulatorsGUI.jar: SimulatorsGUIPackageSource/SimulatorsGUI.jar $(LIBDIR)
	cp $< $@


$(CHIPDIR)/RAM%.class: BuiltInChipsSource/RAM%.java BuiltInChipsSource/RAM.class
	javac -classpath $(CLASSPATH) -d $(INSTALLDIR) $<


$(CHIPDIR)/%Register.class: BuiltInChipsSource/%Register.java BuiltInChipsSource/RegisterWithGUI.class
	javac -classpath $(CLASSPATH) -d $(INSTALLDIR) $<


$(CHIPDIR)/%.class: BuiltInChipsSource/%.java
	javac -classpath $(CLASSPATH) -d $(INSTALLDIR) $<


