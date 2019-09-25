# Load Global Definitions
load 'settings.dem'

#Other Definition
sn2_file="OP/sn2_100_ave.dat"
sn1_file="OP/sn1_100_ave.dat"

#Output
set term postscript eps enhanced color "Times-BoldItalic,15" solid size 3in,2in
set output paper_dir."chainorder.eps" #"sn-1-order.eps"


set tmargin 2
set bmargin 5
set lmargin 7
set rmargin 0
set zeroaxis


set multiplot layout 1,2
set xlabel "C number" offset screen  0.20,0
set ylabel "-S_{CD}" offset 2,0

set xrange [1:16]
set xtics 2,2,15
set ytics 0.04
set yrange [0.00:0.40]
set ytics 0.04
set key bottom left vertical box opaque width 2
#set key left bottom
#set key at screen 0.94,0.88 vertical opaque top width 2

set label "(a) Sn_1" at graph 0.00, 1.05 
plot \
     hopc_dir.sn1_file u 1:2:3 w err ls 1 title "HOPC",\
     '' u 1:2 w l ls 1 notitle,\
     popc_dir.sn1_file u 1:2:3 w err ls 2 title "POPC",\
     '' u 1:2 w l ls 2 notitle,\

set lmargin 0
set rmargin 2
set xtics 2,2,17
set format y ""
#set output paper_dir."sn-2-order.eps"
unset key
set xrange [1:18]
unset ylabel
unset xlabel
set yrange [0.00:0.40]
#set key right top
#unset key
unset label
set label "(b) Sn_2" at graph 0.00, 1.05
plot \
     hopc_dir.sn2_file u 1:2:3 w err ls 1 title "HOPC",\
     '' u 1:2 w l ls 1 notitle,\
     popc_dir.sn2_file u 1:2:3 w err ls 2 title "POPC",\
     '' u 1:2 w l ls 2 notitle,\
