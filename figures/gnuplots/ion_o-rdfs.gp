load "settings.dem"
popciondir=popc_dir."ION_O_RDF/"
hopciondir=hopc_dir."ION_O_RDF/"
set term postscript eps dashed enhanced color "Times-BoldItalic,25" solid
set output paper_dir."ion_o_rdf.eps"
set multiplot layout 2,1
set xrange[0.1:0.35]
set yrange[0:200]
set arrow 1 from 0.3,0 to 0.3,200 nohead lc rgb "red"
set ylabel " "
set tmargin 3
set bmargin 0
set key font "Times-BoldItalic,16" top at graph 1,1.3
set format x ""
plot\
    popciondir."Phosphate_ave.rdf" u 1:2 w l ls 1 title "Phosphate Group Oxygens",\
    '' u 1:2:3 every 2 w err notitle ls 1,\
    popciondir."Backbone_ave.rdf" u 1:2 w l ls 2 title "Backbone Oxygens",\
    '' u 1:2:3 every 2 w err notitle ls 2,\
    popciondir."Ester_ave.rdf" u 1:2 w l ls 3 title "Carbonyl Oxygens",\
    '' u 1:2:3 every 2 w err notitle ls 3,\

set tmargin 0
unset key
unset bmargin
unset format x
set xlabel "r (nm)" 
set ylabel "g(r)" offset 0,4
plot\
    hopciondir."Phosphate_ave.rdf" u 1:2 w l ls 1 title "Phosphate Group Oxygens",\
    '' u 1:2:3 every 2 w err notitle ls 1,\
    hopciondir."Ether_ave.rdf" u 1:2 w l ls 2 title "Backbone Oxygens",\
    '' u 1:2:3 every 2 w err notitle ls 2,\

unset multiplot
set output paper_dir."ion_o_rdf_cum.eps"
#set multiplot layout 2,1
unset arrow 1
#set arrow 1 from 0.3,0 to 0.3,9 lc rgb "red" nohead
set tmargin 3
set key font "Times-BoldItalic,16" top at graph 1,1.2 horizontal
set yrange[0:3]
set ytics 0,0.75,3
set mytics 3
set grid
set xlabel "r (nm)"
set ylabel "n(r)" 
plot\
    popciondir."Phosphate_cum_ave.rdf" u 1:2 w l ls 1 title "POPC Phosphate",\
    '' u 1:2:3 every 2 w err notitle ls 1,\
    popciondir."Backbone_cum_ave.rdf" u 1:2 w l ls 2 title "POPC Backbone",\
    '' u 1:2:3 every 2 w err notitle ls 2,\
    popciondir."Ester_cum_ave.rdf" u 1:2 w l ls 3 title "POPC Carbonyl Oxygens",\
    '' u 1:2:3 every 2 w err notitle ls 3,\
    hopciondir."Phosphate_cum_ave.rdf" u 1:2 w l ls 1 dt 2 title "HOPC Phosphate",\
    '' u 1:2:3 every 2 w err notitle ls 1,\
    hopciondir."Ether_cum_ave.rdf" u 1:2 w l ls 2 dt 2 title "HOPC Backbone",\
    '' u 1:2:3 every 2 w err notitle ls 2,\

#set tmargin 0
#set ytics 0,1.5,8  
#unset key
#unset bmargin
#unset format x
#set xlabel "r (nm)"
#set ylabel "n(r)" offset 0,4
#plot\
#    hopciondir."Phosphate_cum_ave.rdf" u 1:2 w l ls 1 title "Phosphate Group Oxygens",\
#    '' u 1:2:3 every 2 w err notitle ls 1,\
#    hopciondir."Ether_cum_ave.rdf" u 1:2 w l ls 3 title "Ether-Link Oxygens",\
#    '' u 1:2:3 every 2 w err notitle ls 3,\
