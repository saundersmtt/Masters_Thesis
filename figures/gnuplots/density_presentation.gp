#output_dir="/Volumes/Scratch/Documents/jkruczek/simulations/"
#project_dir="/mnt/Scratch_1/Projects/lipidpaper1/"
#no_salt_dir=project_dir."POPC/No_Salt/Analysis_Sample/"

# Load Global Definitions
load 'settings.dem'
#set term png 
#set output output_dir."density.png"
#set xrange [-100:100]
#plot\
#     hopc_dir.'Densities/ave_number2_150ns.dat' u ($1*10):2:3 every 10 w err ls 3 title '',\
#        '' u ($1*10):2 w l            ls 3 notitle,\
#     hopc_dir.'Densities/ave_number2_150ns.dat' u ($1*10):4:5 every 10 w err ls 4 title '',\
#        '' u ($1*10):4 w l            ls 4 notitle,\
#     hopc_dir.'Densities/ave_number2_150ns.dat' u ($1*10):6:7 every 10 w err ls 5 title '',\
#        '' u ($1*10):6 w l            ls 5 notitle,\

# Output
# Need to resize the graph to do the three plots. Look up 'Changing size in postscript terminal'.
set term postscript eps enhanced color "Times-BoldItalic,15" solid size 3in,4in
set style data points

set style fill solid 1.0 noborder
set output paper_dir.'density_presentation.eps'
set multiplot layout 1,2 rowsfirst
#Shared Size Stuff
#set size 1.0,0.21 This one is excessive, but play around with it.
#set tmargin 0
#set bmargin 0
#set lmargin 6
#set rmargin 3
set tmargin 6
set bmargin 0

set xrange [0:*]
set yrange [0:5]
set xtics 0,10,100
set format x "" #Every nm out to 10.#Formerly set xtics 0,1,10; this is experimental.
set ytics 1,1,4
#set title "Number Densities" 
set ylabel "Number Density (nm^{-3})" offset screen 0,-0.2
set key at screen 0.9,1.00 #horizontal width 2 height 2 
set label "(a) POPC" font "Times-BoldItalic" at graph 0.02,0.90
unset arrow
##set arrow from 35.00,0 to 35.00,5 ls 6 nohead
plot \
     popc_dir.'Densities/ave_number_150ns.dat' u ($1*10):12:13 every 10 w err ls 1 title 'P',\
	'' u ($1*10):12 w l ls 1 notitle,\
     popc_dir.'Densities/ave_number_150ns.dat' u ($1*10):10:11 every 10 w err ls 2 title 'N',\
	'' u ($1*10):10 w l ls 2 notitle,\
     popc_dir.'Densities/ave_number_150ns.dat' u ($1*10):6:7 every 10 w err ls 3 title 'Na',\
	'' u ($1*10):6 w l ls 3 notitle,\
     popc_dir.'Densities/ave_number_150ns.dat' u ($1*10):8:9 every 10 w err ls 4 title 'Cl',\
	'' u ($1*10):8 w l ls 4 notitle,\
     popc_dir.'Densities/ave_number_150ns.dat' u ($1*10):(($14+$16)/2):(($15+$17)/2) every 10 w err ls 5 title 'Carbonyl Oxygens',\
	'' u ($1*10):(($14+$16)/2) w l ls 5 notitle,\
#     popc_dir.'Densities/ave_number_150ns.dat' u ($1*10):16:17 every 10 w err ls 6 title 'O37',\
#	'' u ($1*10):16 w l ls 6 notitle, \


unset label
unset key
set origin 0, 0.096
set xrange [0:*]
set yrange [0:5]
set ytics 0,1,4
unset format x
set tmargin 3.8
set bmargin 1
set ylabel " "
set xlabel "Distance from Bilayer Center (Å)" 
set label "(b) HOPC" font "Times-BoldItalic" at graph 0.02,0.90
unset arrow
#set arrow from 35.00,0 to 35.00,5 ls 6 nohead
plot \
     hopc_dir.'Densities/ave_number_150ns.dat' u ($1*10):12:13 every 10 w err ls 1 title 'P',\
        '' u ($1*10):12 w l ls 1 notitle,\
     hopc_dir.'Densities/ave_number_150ns.dat' u ($1*10):10:11 every 10 w err ls 2 title 'N',\
        '' u ($1*10):10 w l ls 2 notitle,\
     hopc_dir.'Densities/ave_number_150ns.dat' u ($1*10):6:7 every 10 w err ls 3 title 'Na',\
        '' u ($1*10):6 w l ls 3 notitle,\
     hopc_dir.'Densities/ave_number_150ns.dat' u ($1*10):8:9 every 10 w err ls 4 title 'Cl',\
        '' u ($1*10):8 w l ls 4 notitle,\

unset xlabel
unset label
unset key
set ylabel "  "
set xrange [10:85]
set yrange [0:.2]
set origin 0.25, 0.600
set size 0.7, 0.3
unset format x
set ytics 0.1
set xtics 10
set mxtics 10
unset arrow
#set arrow from 35.00,0 to 35.00,0.2 ls 6 nohead
plot \
     popc_dir.'Densities/ave_number_150ns.dat' u ($1*10):6:7 every 10 w err ls 3 title 'Na',\
        '' u ($1*10):6 w l ls 3 notitle,\
     popc_dir.'Densities/ave_number_150ns.dat' u ($1*10):8:9 every 10 w err ls 4 title 'Cl',\
        '' u ($1*10):8 w l ls 4 notitle,\

unset xlabel
unset key
unset label
set size 0.7,0.3 
set xrange [10:85]
set yrange [0:.2]
set origin 0.25, 0.250
set ytics 0.1
unset arrow
#set arrow from 35.00,0 to 35.00,0.2 ls 6 nohead
plot \
     hopc_dir.'Densities/ave_number_150ns.dat' u ($1*10):6:7 every 10 w err ls 3 title 'Na',\
        '' u ($1*10):6 w l ls 3 notitle,\
     hopc_dir.'Densities/ave_number_150ns.dat' u ($1*10):8:9 every 10 w err ls 4 title 'Cl',\
        '' u ($1*10):8 w l ls 4 notitle,\

unset multiplot
unset arrow
set term postscript eps enhanced color "Times-BoldItalic,15" solid size 3in,4in
set output paper_dir."dens_3component.eps"
set multiplot layout 2,1
set grid
set ylabel "Mass Density (kg m^{-3})" offset screen 0,-0.2
set xrange [0:40]
set yrange [0:1150]
set ytics 100,200,1100
set tmargin 4.0
unset mxtics
set format x"" 
set label "(a) POPC" font "Times-BoldItalic" at graph 0.02,0.90
unset key
set key at screen 0.9,1
set bmargin 0
plot \
     popc_dir.'Densities/ave_mass_150ns.dat' u ($1*10):6:7 every 10 w err ls 1 title 'Water and Ions',\
	'' u ($1*10):6 w l ls 1 notitle,\
     popc_dir.'Densities/ave_mass_150ns.dat' u ($1*10):8:9 every 10 w err ls 4 title 'Water',\
	'' u ($1*10):8 w l ls 4 notitle,\
     popc_dir.'Densities/ave_mass_150ns.dat' u ($1*10):2:3 every 10 w err ls 2 title 'Headgroup and Backbone',\
	'' u ($1*10):2 w l ls 2 notitle,\
     popc_dir.'Densities/ave_mass_150ns.dat' u ($1*10):4:5 every 10 w err ls 3 title 'Chains',\
        '' u ($1*10):4 w l            ls 3 notitle,\

unset format x
unset label
set label "(b) HOPC" font "Times-BoldItalic,14" at graph 0.02,0.90
set bmargin 4.0
set tmargin 0
set xlabel "Distance from Bilayer Center (Å)"
set ylabel " "
plot\
     hopc_dir.'Densities/ave_mass_150ns.dat' u ($1*10):6:7 every 10 w err ls 1 title '',\
        '' u ($1*10):6  w l            ls 1 notitle,\
     hopc_dir.'Densities/ave_mass_150ns.dat' u ($1*10):8:9 every 10 w err ls 4 title '',\
	'' u ($1*10):8 w l ls 4 notitle,\
     hopc_dir.'Densities/ave_mass_150ns.dat' u ($1*10):2:3 every 10 w err ls 2 title '',\
        '' u ($1*10):2 w l            ls 2 notitle,\
     hopc_dir.'Densities/ave_mass_150ns.dat' u ($1*10):4:5 every 10 w err ls 3 title '',\
        '' u ($1*10):4 w l            ls 3 notitle,\
