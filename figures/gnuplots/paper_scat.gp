# Load Global Definitions
load 'settings.dem'

set term postscript eps enhanced color "Times-BoldItalic,25" solid 
set output paper_dir."ele_scattering_density.eps"
#set multiplot layout 2,1
#set bmargin 0
set lmargin 1
set rmargin 1
set size square
set ytics 250,50,400
set yrange [150:500]
set tmargin 2
set xrange [-5:5]
set xtics 10
set mxtics 10 
#set ytics 4,2,20
#set xtics 1
#unset xrange
#unset yrange
#unset size
set grid
set key at screen 0.72,0.95 horizontal width 2 box font ",20"
set xrange [-38:38]
#set yrange [0:25]
#set size 0.6, 0.9
#set origin -0.033, 0
#set format x ""
#set key top right
set xlabel "z (Å)" #offset screen 0.25,0
set ylabel " Electron Density (nm^{-3}) " #offset 1,0
#set label "(a) Electron Density" at graph 0.05, 0.07 font "Times-BoldItalic,14"
plot \
     popc_dir.'Densities/ave_electron_150ns_plot.dat' u ($1*10):($2) w l ls 2 notitle,\
     '' u ($1*10):2:3 every 8 w err ls 2 title 'POPC',\
     hopc_dir.'Densities/ave_electron_150ns_plot.dat' u ($1*10):($2) w l ls 1 notitle,\
     '' u ($1*10):2:3 every 8 w err ls 1 title 'HOPC'





