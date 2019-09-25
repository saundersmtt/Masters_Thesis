# Load Global Definitions
load 'settings.dem'
dat1_file='WaterAuto/acf_merge_fit.dat'
dat2_file='WaterAuto/acf_merge_fit.dat'
set grid
set term postscript eps enhanced color "Times-BoldItalic,15" solid size 3,4
set output paper_dir."Corrtime.eps"
set multiplot layout 3,1 rowsfirst
set bmargin 0
set key box width 2
unset xlabel
set ytics 400,175,1900
set rmargin 0
set mytics 5 
unset title
set lmargin 10
unset ylabel
#set ylabel "water auto correlation time tao (ps)"
set format x ""
#set xrange [15:50]
set yrange [50:2000]
set arrow from 16.315,50 to 16.315,1900 ls 1 dt 2 nohead 
set label "D_{C}" at 15.5,1920 tc rgb "red" font ",14" front
set arrow from 16.07,50 to 16.07,1900 ls 2 dt 2 nohead
set arrow from 23.03,50 to 23.03,1900 ls 1 dt 3 nohead
set label "D_{B}" at 22.5,1920 tc rgb "red" font ",14" front
set arrow from 23.110,50 to 23.110,1900 ls 2 dt 3 nohead
set ylabel "{/Symbol t}_1 (ps)"
plot \
     popc_dir.dat2_file u 1:9 w lp ls 2 linewidth 2 title 'POPC', \
	'' u 1:9:10  w err ls 2 notitle,\
     hopc_dir.dat2_file u 1:9 w lp ls 1 linewidth 2 title 'HOPC', \
	'' u 1:9:10   w err ls 1 notitle,\

unset key
unset arrow
set ytics 15,15,65
set bmargin 0
set tmargin 0
set yrange[0:75]
set arrow from 16.315,00 to 16.315,75 ls 1 dt 2 nohead
set arrow from 16.07,00 to 16.07,75 ls 2 dt 2 nohead
set arrow from 23.03,00 to 23.03,75 ls 1 dt 3 nohead
set arrow from 23.110,00 to 23.110,75 ls 2 dt 3 nohead
set ylabel "{/Symbol t}_2 (ps)"
plot \
     popc_dir.dat2_file u 1:6 w lp ls 2 linewidth 2 title 'POPC', \
	'' u 1:6:7   w err ls 2 notitle,\
     hopc_dir.dat2_file u 1:6 w lp ls 1 linewidth 2 title 'HOPC', \
	'' u 1:6:7   w err ls 1 notitle,\

unset format x
set xlabel "Distance from Bilayer Center (Å)"
set bmargin 5
set ytics 0,1,4
set yrange [0:4]
unset arrow
unset arrow
set arrow from 16.315,00 to 16.315,4 ls 1 dt 2 nohead
set arrow from 16.07,00 to 16.07,4 ls 2 dt 2 nohead
set arrow from 23.03,00 to 23.03,4 ls 1 dt 3 nohead
set arrow from 23.110,00 to 23.110,4 ls 2 dt 3 nohead
set ylabel "{/Symbol t}_3 (ps)"
plot \
     popc_dir.dat2_file u 1:3 w lp ls 2 linewidth 2 title 'POPC', \
	'' u 1:3:4   w err ls 2 notitle,\
     hopc_dir.dat2_file u 1:3 w lp ls 1 linewidth 2 title 'HOPC', \
	'' u 1:3:4   w err ls 1 notitle,\

