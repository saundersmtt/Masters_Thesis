# Load Global Definitions
load 'settings.dem'

#set encoding iso
set term postscript eps enhanced color "Times-BoldItalic,15" solid size 3in,3.5in
set output paper_dir.'cood.eps'

set multi 
#Shared Size Stuff
set size 1.0,0.42
set tmargin 4
set bmargin 0
set lmargin 6
set rmargin 3

set grid
set zeroaxis
set xrange [7.5:35]
set xtics 7.5,5,35
#End Shared Stuff

set style data points

#Start First Special#
set key at screen 0.96,1 horizontal width 2 
set ylabel "Number of Neighbors" offset screen 0, -0.15
#End First Special#
#Start All But Last
set format x ""
#End All But Last
set yrange[0:7]
set ytics 2,2,6
set origin 0.0, 0.52
set label "(a) POPC" at graph 0.05, 0.95 font "Times-BoldItalic "
plot\
        popc_dir.'LIPID_CATIONCOOD/coordination_summary.dat' u ($1*10):2:3  every 5 w err ls 3 title "Water",\
	'' u ($1*10):2:3  w l ls 3 notitle,\
        '' u ($1*10):($4+$6+$8+$10):(($5+$7+$9+$11)/4) every 5 w err ls 1 title "Phosphate Oxygens",\
	'' u ($1*10):($4+$6+$8+$10) w l ls 1 notitle,\
        '' u ($1*10):($12+$14):(($13+$15)/2) every 5 w err ls 7 title "Backbone Oxygens",\
	'' u ($1*10):($12+$14) w l ls 7 notitle,\
        '' u ($1*10):($16+$18):(($17+$19)/2) every 5 w err ls 5 title "Carbonyl Oxygens",\
	'' u ($1*10):16 w l ls 5 notitle,\
        '' u ($1*10):($2+$4+$6+$8+$10+$12+$14+$16+$18) w l ls 6 title "Total"


#Start All But First
unset label
unset ylabel
unset key
set tmargin 0
set bmargin 2
unset format x
#End All But First
set yrange[0:7]
set ytics 2,2,6
set origin 0.0, 0.10
set xlabel "Distance from Bilayer Center (Å)"
set label "(b) HOPC" at graph 0.05, 0.95 font "Times-BoldItalic "
plot\
	hopc_dir.'LIPID_CATIONCOOD/coordination_summary.dat' u ($1*10):2:3 every 5 w err ls 3 title "Water HOPC",\
	'' u ($1*10):2 w l ls 3 notitle,\
	'' u ($1*10):($4+$6+$8+$10):(($5+$7+$9+$11)/4) every 5 w err ls 1 title "Phosphate Oxygens HOPC",\
	'' u ($1*10):($4+$6+$8+$10) w l ls 1 notitle,\
	'' u ($1*10):($12+$14):(($13+$15)/2) every 5  w err ls 7 title "Backbone Oxygens HOPC",\
	'' u ($1*10):($12+$14) w l ls 7 notitle,\
	'' u ($1*10):($2+$4+$6+$8+$10+$12+$14+$16)  w l ls 6 title "Total HOPC",\
