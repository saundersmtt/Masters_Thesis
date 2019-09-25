load "settings.dem"
popciondir=popc_dir."H-RDF/"
hopciondir=hopc_dir."H-RDF/"
set term postscript eps dashed enhanced color "Times-BoldItalic,25" solid
set output paper_dir."h_rdf.eps"
set multiplot layout 2,1
set xrange[01:10]
set yrange[0:*]
#set arrow 1 from 0.3,0 to 0.3,200 nohead lc rgb "red"
set ylabel " "
set tmargin 3
set bmargin 0
set key font "Times-BoldItalic,16" top at graph 1,1.3
set format x ""
plot\
    popciondir."Phos_ave.rdf" u ($1*10):2 w l  ls 1 title "Phosphate Group Oxygens",\
    '' u ($1*10):2:3 every 2 w err notitle  ls 1,\
    popciondir."Backbone_ave.rdf" u ($1*10):2 w l  ls 2 title "Backbone Oxygens",\
    '' u ($1*10):2:3 every 2 w err notitle  ls 2,\
    popciondir."Ether_ave.rdf" u ($1*10):2 w l  ls 3 title "Carbonyl Oxygens",\
    '' u ($1*10):2:3 every 2 w err notitle  ls 3,\

set tmargin 0
unset key
unset bmargin
unset format x
set xlabel "r (Å)" 
set ylabel "g(r)" offset 0,4 
plot\
    hopciondir."Phos_ave.rdf" u ($1*10):2 w l  ls 1 title "Phosphate Group Oxygens",\
    '' u ($1*10):2:3 every 2 w err notitle  ls 1,\
    hopciondir."Ether_ave.rdf" u ($1*10):2 w l  ls 2 title "Ether-Link Oxygens",\
    '' u ($1*10):2:3 every 2 w err notitle  ls 2,\

unset multiplot
set output paper_dir."h_rdf_cum.eps"
#set multiplot layout 2,1
unset arrow 1
#set arrow 1 from 0.3,0 to 0.3,9 lc rgb "red" nohead
set tmargin 3
unset key
set key font "Times-BoldItalic,16" at graph 0.45,0.95 vertical box
set tmargin 1
set yrange[0:*]
set xrange[1:4]
#set ytics 0,0.75,3
set mytics 3
set grid
set xlabel "r (Å)"
set ylabel "n(r)" offset 0,0
plot\
    popciondir."Phos_cum_ave.rdf" u ($1*10):2 w l  ls 1 lw 6 title "POPC Phosphate",\
    '' u ($1*10):2:3 every 2 w err notitle  ls 1,\
    popciondir."Backbone_cum_ave.rdf" u ($1*10):2 w l  ls 7 lw 6 title "Backbone",\
    '' u ($1*10):2:3 every 2 w err notitle  ls 7,\
    popciondir."Ether_cum_ave.rdf" u ($1*10):2 w l  ls 5 lw 6 title "Carbonyl Oxygens",\
    '' u ($1*10):2:3 every 2 w err notitle  ls 5,\
    hopciondir."Phos_cum_ave.rdf" u ($1*10):2 w l  ls 10 lw 6 title "HOPC Phosphate",\
    '' u ($1*10):2:3 every 2 w err notitle ls 10,\
    hopciondir."Backbone_cum_ave.rdf" u ($1*10):2 w l ls 70  lw 6 title "Backbone",\
    '' u ($1*10):2:3 every 2 w err notitle ls 70 ,\

#set tmargin 0
#set ytics 0,1.5,8  
#unset key
#unset bmargin
#unset format x
#set xlabel "r (Å)"
#set ylabel "n(r)" offset 0,4
#plot\
#    hopciondir."Phosphate_cum_ave.rdf" u ($1*10):2 w l  ls 1 title "Phosphate Group Oxygens",\
#    '' u ($1*10):2:3 every 2 w err notitle  ls 1,\
#    hopciondir."Ether_cum_ave.rdf" u ($1*10):2 w l  ls 3 title "Ether-Link Oxygens",\
#    '' u ($1*10):2:3 every 2 w err notitle  ls 3,\
