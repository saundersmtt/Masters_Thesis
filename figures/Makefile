GNUPLOT_CMD   = $(shell if [[ "`hostname`" == *".cas.usf.edu" ]]; then echo "/sw64/bin/gnuplot"; else echo "gnuplot"; fi)
export GNUPLOT_CMD

SUBDIRS   = ./ #NDensities OP Area EDensities Formfactor H2Order Potential WaterACF Tau Angle
SUBDIRSCLEAN=$(addsuffix clean,$(SUBDIRS))
EPSFILES=$(ls ./*.eps |grep -v boximage)
all: $(SUBDIRS)
$(SUBDIRS):
	./make_plots.sh $(GNUPLOT_CMD)

clean: #$(SUBDIRSCLEAN)
	rm -f ./*.eps
	rm -f ./*.pdf
	rm -f ./*.png
#%clean: %
#	$(MAKE) clean -C $<

.PHONY: all $(SUBDIRS)

