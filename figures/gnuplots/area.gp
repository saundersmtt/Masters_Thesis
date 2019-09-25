# Load Global Definitions
load 'settings.dem'
set encoding utf8 

# Other Definitions
areadhpc=hopc_dir."Box/area.dat"
areadppc=popc_dir."Box/area.dat"

# Output
set term postscript eps enhanced color "Times-BoldItalic,25" size 3.5,4
set output paper_dir."area.eps"

#set size 1,1
#set title "Area Per Lipid" 
set grid
set style data points
set xlabel "Time (ns)"
set ylabel "Area per Lipid (Å^2)"
set yr [*:*]
set xr [0:*]
set size square
plot \
     areadhpc u ($1/1000):($2*100) w l ls 1 title 'HOPC',\
     areadppc u ($1/1000):($2*100) w l ls 2 title 'POPC',\


