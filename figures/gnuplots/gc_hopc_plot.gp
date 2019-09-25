load 'settings.dem'
set term postscript eps enhanced color "Times-BoldItalic,25" solid #png size 1800, 1600
set style data points
set tics font "Times-BoldItalic,15"
set tmargin 4
set lmargin 6
set mxtics 10
set rmargin 0.5
set key at screen 0.895,0.98 vertical width 2 font ",18"
set style fill solid 1.0 noborder
set output paper_dir.'gouy_HOPC_potential.eps'
#set output './gouy_POPC_potential.eps'
set multiplot layout 2,1 rowsfirst
set ytics 0,10,60
set zeroaxis
set yrange [*:60]
y0(s)=0.26*s
load "HOPC_GC.dem"
set xrange[-D/2:D/2]

y1(x)=y0(s)*exp(-K*(x+(D/2)))
y2(x)=y0(s)*exp(K*(x-(D/2)))

y(x)=y1(x)+y2(x)-(y1(0)+y2(0))/2

na(x)=p0*exp(-38*y(x))
cl(x)=p0*exp(38*y(x))
set format x ''
set bmargin 0
set ylabel "{/Symbol y}(z) (mV)" font "Times-BoldItalic,15" offset 1,0,0
plot y(x)*1000 w l ls 1 title "Surface Potential from Theory",\
hopc_dir.'Potential/average_electric_potential.dat' u (($1-9.750000)):($6*1000):($7*1000) every 13 w err ls 2 title "Potential from Sim",\
hopc_dir.'Potential/average_electric_potential.dat' u (-($1-9.750000)):($6*1000):($7*1000) every 13 w err ls 2 notitle
 
set key at screen 0.90,0.90 horizontal width 2 font ",20"
unset format x
unset yrange
set ylabel "{/Symbol r}(z) (nm^{-3})" font "Times-BoldItalic,15" offset 3,0,0
#set output paper_dir.'gouy_POPC_Density.eps'
set bmargin 3.5
set ytics 0.03,0.05,0.25
set xlabel "Distance from Center of Solvent (Å)"
set tmargin 0
#set key vertical
plot na(x) ls 3 title "Na^+ Theoretical",\
cl(x) ls 4 title "Cl^- Theoretical",\
hopc_dir.'GC_Stuff/testing_Na_Dens.dat' u 1:2:3 every 8 w err ls 3 title "Na^+ Sim",\
hopc_dir.'GC_Stuff/testing_Cl_Dens.dat' u 1:2:3 every 8 w err ls 4 title "Cl^- Sim"

