load 'settings.dem'
set term postscript eps enhanced color "Times-BoldItalic" solid 16#size 1600,1000
set output paper_dir."ion_cood_count.eps"
set multiplot layout 2,1
set grid
set key at screen 0.94,0.95 horizontal width 1 box font ",14"
#set yrange [-0.3:*]
set ylabel "Number of Ions with more than 3 Waters in their First Shell" offset screen 0,-0.25
unset xrange
set xrange [0000:*]
set yrange [0:108]
set ytics 10
set format x ""
plot\
	popc_dir.'IONCOOD/counts_NA.ioncood' u ($1/1000):2 every 500 w lp ls 1 title "POPC",\
        hopc_dir.'IONCOOD/counts_NA.ioncood' u ($1/1000):2 every 500 w lp ls 2 title "HOPC"

unset key
set xlabel "Time (ns)"
set ylabel "  "
unset format x
plot\
	popc_dir.'IONCOOD/counts_CL.ioncood' u ($1/1000):2 every 500 w lp ls 1 title "POPC",\
	hopc_dir.'IONCOOD/counts_CL.ioncood' u ($1/1000):2 every 500 w lp ls 2 title "HOPC",\

