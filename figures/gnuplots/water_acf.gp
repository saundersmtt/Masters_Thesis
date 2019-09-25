# Load Global Definitions
load 'settings.dem'

dat1_file='WaterAuto/acf_merge_16.dat'
dat2_file='WaterAuto/acf_merge_14.dat'
dat3_file='WaterAuto/acf_merge_10.dat'
fitpopc=popc_dir.'WaterAuto/acf_merge_fit.dat'
set term png size 950, 1600 font ",20"
set style data points
set output output_dir.'water_acf.png'

set multiplot layout 2,1 rowsfirst

set ylabel "acf"
set xlabel "time (ps)"

set yrange [0:1]

set title "POPC"
plot \
     popc_dir.dat1_file u 1:2 every 8::0 w p ls 1 notitle,\
     ((0.465782)*exp(-x/0.484991)+(0.206636)*exp(-x/49.818250)+(0.327582)*exp(-x/965.728766)) w l ls 1 title '16 Å',\
     popc_dir.dat2_file u 1:2 every 8::2 w p ls 2 notitle, \
     ((0.451719)*exp(-x/0.428803)+(0.197244)*exp(-x/58.666291)+(0.351037)*exp(-x/1176.381636)) w l ls 2 title '14 Å',\
     popc_dir.dat3_file u 1:2 every 8::4 w p ls 3 notitle,\
     ((0.461484)*exp(-x/0.438980)+(0.170352)*exp(-x/69.797592)+(0.368164)*exp(-x/1469.056957)) w l ls 3 title '10 Å'

set title "HOPC"
plot \
     hopc_dir.dat1_file u 1:2 every 8::0 w p ls 1 notitle,\
     ((0.412857)*exp(-x/(0.335295))+(0.107888)*exp(-x/(60.507549))+(0.479255)*exp(-x/(1425.315251))) w l ls 1 title '16 Å',\
     hopc_dir.dat2_file u 1:2 every 8::2 w p ls 2 notitle, \
     ((0.463524)*exp(-x/0.927917)+(0.163880)*exp(-x/267158.022776)+(0.372596)*exp(-x/683.016904)) w l ls 2 title '14 Å',\
     hopc_dir.dat3_file u 1:2 every 8::4 w p ls 3 notitle,\
     ((0.490106)*exp(-x/0.451328)+(0.341124)*exp(-x/135.187853)+(0.168770)*exp(-x/3880333.985793)) w l ls 3 title '10 Å'




