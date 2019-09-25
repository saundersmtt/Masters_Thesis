load "settings.dem"
set term postscript eps enhanced color "Times-BoldItalic,25" solid
set output paper_dir."neutron.eps"
set multi
set grid
set key outside box width 2
set xlabel "z (Å)"
set ylabel "Scattering Length Density (nm^{-3})" #offset 0.0, 4.9
#set label "(b) Neutron Scattering Length Density" at graph 0.05, 0.07 font "Times-BoldItalic,14"
        plot hopc_dir.'Densities/ave_neutron50_150ns_plot.dat' u ($1*10):($2) w l ls 1 title 'HOPC',\
        popc_dir.'Densities/ave_neutron50_150ns_plot.dat' u ($1*10):($2) w l ls 2 title 'POPC'

#unset xlabel
#unset key
#unset ylabel
#unset label
#unset ytics
#set xrange [15:35]
#set yrange [0:2]
#set origin 0.70, 0.095
#set size 0.23, 0.25
##set ytics 0,1,3
#plot \
#      hopc_dir.'Densities/ave_number2_100ns.dat' u ($1*10):6:7 every 10 w err ls 1 title 'Water and Ions',\
#        '' u ($1*10):6 w l ls 1 notitle,\
#      popc_dir.'Densities/ave_number2_100ns.dat' u ($1*10):6:7 every 10 w err ls 2 title 'Water and Ions',\
#        '' u ($1*10):6 w l ls 2 notitle
