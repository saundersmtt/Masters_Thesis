# Load Global Definitions
load 'settings.dem'

# Load Global Definitions
load 'settings.dem'

set term postscript eps enhanced color "Times-BoldItalic,15" solid size 3in,4in
set output paper_dir."formfactor.eps"
set multi layout 2,1



#set bmargin 4
set lmargin 10
set xtics 0.1,0.1,0.5
set ytics 4,2,20

set grid

set xrange [0.0:0.6]
set yrange [0:25]
#set size 0.6, 0.9
#set origin 0.0, 0.05

#set ylabel "| F(q) |" #offset 1,0
#set xlabel "q (Å^{-1})" #offset #screen 0.25,0
set format x " "
set bmargin 0
set label "(a) POPC" at graph 0.1, 0.9 font "Times-BoldItalic"
plot \
     popc_dir.'Densities/formfactor_150ns.dat' u ($1/10):($2*0.01894) w l notitle ls 2

#set origin 0.5, 0.05
#set size 0.6, 0.9
unset label
#unset ylabel
#unset xlabel
#set format y ""
set tmargin 0
set bmargin 5
set format x
set xlabel "q (Å^{-1})"
set ylabel "| F(q) |" offset 0.0, 7  
set label "(b) HOPC" at graph 0.1, 0.9 font "Times-BoldItalic"
plot hopc_dir.'Densities/formfactor_150ns.dat' u ($1/10):($2*0.01894) w l notitle ls 1

