load 'settings.dem'
set term postscript eps enhanced color "Times-BoldItalic,13" solid size 3,2.5
set style data points
set tics font "Times-BoldItalic,11"
set tmargin 5
set lmargin 7
set mxtics 10
set mytics 10
set rmargin 0.5
set key at screen 0.35,0.95 horizontal  
set style fill solid 1.0 noborder
set output paper_dir.'gouy.eps'
#set output './gouy_POPC_potential.eps'
set multiplot layout 2,2 #columnsfirst
set ytics 0,10,60 nomirror
set zeroaxis
set yrange [-10:60]
y0(s)=0.26*s
load "POPC_GC.dem"
#s=0.13
#K=0.98
#D=13.1674 * 10
#p0=0.043
set xrange[10*(-13/2-1):10*(13/2+1)]

y1(x)=y0(s)*exp(-K*(x+(D/2)))
y2(x)=y0(s)*exp(K*(x-(D/2)))

y(x)=y1(x)+y2(x)-(y1(0)+y2(0))

na(x)=p0*exp(-38*y(x))
cl(x)=p0*exp(38*y(x))
set format x ''
set bmargin 0
set ylabel "{/Symbol y}(z) (mV)"  offset 1,-5,0
set label "(a) POPC"  at graph 0.035,0.90
set arrow 1 from -D/2,-10 to -D/2,60 nohead ls 6
set arrow 2 from D/2,-10 to D/2,60 nohead ls 6
plot y(x)*1000 w l ls 1 title "Potential, Theoretical",\
popc_dir.'Potential/average_electric_potential.dat' u (10*($1-9.750000)):($6*1000):($7*1000) every 13 w err ls 2 title "Simulation",\
popc_dir.'Potential/average_electric_potential.dat' u (-10*($1-9.750000)):($6*1000):($7*1000) every 13 w err ls 2 notitle
 
unset arrow 1
unset arrow 2
set arrow 1 from -D/2,0.01 to -D/2,0.25 nohead ls 6
set arrow 2 from D/2,0.01 to D/2,0.25 nohead ls 6
set key at screen 0.98,1 horizontal  
#unset format x
unset yrange
set ylabel "{/Symbol r}(z) (nm^{-3})"  offset 2,-5,0
unset label
set label "(b) POPC"  at graph 0.035,0.90
#set output paper_dir.'gouy_POPC_Density.eps'
#set bmargin 3.5
set ytics 0.03,0.05,0.25 nomirror
#set xlabel "Distance from Center of Solvent (Å)"
#set tmargin 0
#set key vertical
set yrange[0.01:0.25]
plot na(x) ls 3 title "Na^+, Theoretical",\
cl(x) ls 4 title "Cl^-",\
popc_dir.'GC_Stuff/test_Na_Dens.sym.dat' u ($1*10):2:3 every 30 w err ls 3 title "Na^+, Simulation",\
popc_dir.'GC_Stuff/test_Cl_Dens.sym.dat' u ($1*10):2:3 every 30 w err ls 4 title "Cl^-"

set ytics 0,10,60
set zeroaxis
set yrange [*:60]
y0(s)=0.26*s
load "HOPC_GC.dem"
set xrange[10*(-13/2-1):10*(13/2+1)]

y1(x)=y0(s)*exp(-K*(x+(D/2)))
y2(x)=y0(s)*exp(K*(x-(D/2)))

y(x)=y1(x)+y2(x)-(y1(0)+y2(0))

na(x)=p0*exp(-38*y(x))
cl(x)=p0*exp(38*y(x))
unset format x 
unset label
unset key
set yrange [-10:60]
unset arrow 1
unset arrow 2
set arrow 1 from -D/2,-10 to -D/2,60 nohead ls 6
set arrow 2 from D/2,-10 to D/2,60 nohead ls 6
set bmargin 4
set tmargin 0
#set ylabel "{/Symbol y}_{HOPC}(z) (mV)"  offset 1,0,0
set label "(c) HOPC"  at graph 0.035,0.90
unset ylabel
plot y(x)*1000 w l ls 1 title "Surface Potential from Theory",\
hopc_dir.'Potential/average_electric_potential.dat' u (10*($1-9.750000)):($6*1000):($7*1000) every 13 w err ls 2 title "Potential from Sim",\
hopc_dir.'Potential/average_electric_potential.dat' u (-10*($1-9.750000)):($6*1000):($7*1000) every 13 w err ls 2 notitle
 
unset key
unset format x
unset yrange
set yrange[0.01:0.25]
unset arrow 1
unset arrow 2
set arrow 1 from -D/2,0.01 to -D/2,0.25 nohead ls 6
set arrow 2 from D/2,0.01 to D/2,0.25 nohead ls 6
#set ylabel "{/Symbol r}_{HOPC}(z) (nm^{-3})"  offset 3,0,0
#set output paper_dir.'gouy_POPC_Density.eps'
set bmargin 4
set ytics 0.03,0.05,0.25
set xlabel "Distance from Center of Solvent-Occupied Region (Å)"  offset -15,0,0
set tmargin 0
unset label
set label "(d) HOPC" at graph 0.035,0.90
#set key vertical
plot na(x) ls 3 title "Na^+ Theoretical",\
cl(x) ls 4 title "Cl^- Theoretical",\
hopc_dir.'GC_Stuff/testing_Na_Dens.sym.dat' u ($1*10):2:3 every 30 w err ls 3 title "Na^+ Sim",\
hopc_dir.'GC_Stuff/testing_Cl_Dens.sym.dat' u ($1*10):2:3 every 30 w err ls 4 title "Cl^- Sim"

