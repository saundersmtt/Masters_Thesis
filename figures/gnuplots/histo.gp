# Load Global Definitions
load 'settings.dem'

dir=dppc_dir.'/Angle/'
good=dir."85-90_P-N_hist.xvg"
bad=dir.'130-135_P-N_hist.xvg'

set term png size 950, 950 
set style data points
set output output_dir.'histo.png'

plot \
     good u 1:2 w boxes title "Good",\
     bad u 1:2 w boxes title "Bad"

#/mnt/Scratch_1/Projects/etherlipidpaper/DPPC/Analysis_Sample/Angle
