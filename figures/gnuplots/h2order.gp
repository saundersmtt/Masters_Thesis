# Load Global Definitions
load 'settings.dem'

dat_file='H2Order/ave.h2order'

set term postscript eps enhanced colour "Times-BoldItalic,15" solid size 3in,3.5in
set key box vertical width 2
set style data points
set output paper_dir.'h2order.eps'
set multiplot layout 2,1
set xrange [5:70]
set xtics 5,10,70
set mxtics 10
set ytics -0.2,0.2,0.2
set mytics 2
set yrange [-0.3:0.3]
set bmargin 0
set grid
set key top right
set ylabel "P_1"
#set yrange [-0.3:0.01]
set format x ""
set label "(a) P_1" at graph 0.03, 0.95 font "Times-BoldItalic,14"
#set arrow 1 from 35.91,-0.3 to 35.91,0.3 ls 2 dt 2 nohead
plot \
     hopc_dir.'H2Order/ave.h2order' u ($1*10):2:3 every 10 w err ls 1 title 'HOPC',\
     '' u ($1*10):2 w l ls 1 notitle,\
     popc_dir.'H2Order/ave.h2order' u ($1*10):2:3 every 10 w err ls 2 title 'POPC',\
     '' u ($1*10):2 w l ls 2 notitle,\
     

set arrow 1 from 21.60,-0.2 to 21.60,0.2 ls 1 dt 4 nohead 
set arrow 2 from 27.15,-0.2 to 27.15,0.2 ls 1 dt 4 nohead
set arrow 6 from 34.66,-0.2 to 34.66,0.2 ls 1 dt 4 nohead
set arrow 3 from 20,-0.2 to 20,0.2 ls 2 dt 2 nohead
set arrow 4 from 27.5,-0.2 to 27.5,0.2 ls 2 dt 2 nohead
set arrow 5 from 35.09,-0.2 to 35.09,0.2 ls 2 dt 2 nohead
unset label
set ylabel "P_2"
set tmargin 0
set bmargin 4
set grid ls 0, ls 0
#set yrange [-0.15:0.12]
unset yrange
unset format x
set ytics -0.1,0.1,0.1
set yrange [-0.2:0.2]
set xlabel "Distance from Bilayer Center (Å)"
set label "B_{-1}" at graph 0.1, 0.80 tc rgb "red"
set label "B_{+}" at graph 0.27, 0.80 tc rgb "red"
set label "B_{-2}" at graph 0.38, 0.80  tc rgb "red"
set label "Bulk" at graph 0.5, 0.80 tc rgb "red"
set label "(b) P_2" at graph 0.03, 0.95 font "Times-BoldItalic,14"
unset key
plot \
     hopc_dir.'H2Order/ave.h2order' u ($1*10):4:5 every 10 w err ls 1 title 'HOPC',\
     '' u ($1*10):4 w l ls 1 notitle,\
     popc_dir.'H2Order/ave.h2order' u ($1*10):4:5 every 10 w err ls 2 title 'POPC',\
     '' u ($1*10):4 w l ls 2 notitle
#set yr [0:0.4]

#set title "sqrt(P_1^2 + P_2^2)"
#plot \
 

