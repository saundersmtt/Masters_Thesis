# Load Global Definitions
load 'settings.dem'

dat_file='Potential/average_electric_potential.dat'
set term postscript eps enhanced color "Times-BoldItalic,15" solid size 3in,2.8in
set output paper_dir."potential.eps"
set key box width 2
set xrange [1:60]
set xtics 0,10,60
set mxtics 10
set grid
set xlabel "Distance from Bilayer Center (Å)"
set ylabel "Electrostatic Potential (mV)"
plot \
     popc_dir.dat_file u ($1*10):($6*1000):($7*1000) every 5 w err  ls 2 title 'POPC', \
'' u ($1*10):($6*1000) w l ls 2 notitle,\
     hopc_dir.dat_file u ($1*10):($6*1000):($7*1000) every 5 w err  ls 1 title 'HOPC', \
'' u ($1*10):($6*1000) w l ls 1 notitle,
