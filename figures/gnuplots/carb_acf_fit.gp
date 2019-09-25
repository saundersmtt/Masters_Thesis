# Load Global Definitions
load 'settings.dem'

dat_file='WaterAuto/100-105_water_acf.xvg'
dhpc_out=dhpc_dir.'WaterAuto/fits.dat'
dppc_out=dppc_dir.'WaterAuto/fits.dat'

set print dppc_dir.'Carb_ACF/acf.dat'

# A(a) = (0.95 - 0.05)/pi*(atan(a)+pi/2) + 0.05
# B(b) = (0.95 - 0.05)/pi*(atan(b)+pi/2) + 0.05
# K1(k1) = sqrt(k1*k1)
# K2(k2) = sqrt(k2*k2)
# f(x)=A(a)*exp(-K1(k1)*x)+(B(b))*exp(-K2(k2)*x)

# a=0.5
# b=0.5
# k1=0.1
# k2=0.01
# fit f(x) dppc_dir.'Carb_ACF/acf_merge.dat' u 1:2 via k1,k2,a,b
# print sprintf("%f\t%f\t%f\t%f\t%f\t%f\t%f", j, A(a), B(b), K1(k1) > K2(k2) ? K1(k1) : K2(k2), K1(k1) < K2(k2) ? K1(k1) : K2(k2), K1(k1) > K2(k2) ? 1.0/K1(k1) : 1.0/K2(k2), K1(k1) < K2(k2) ? 1.0/K1(k1) : 1.0/K2(k2))

# exit

do for [j=50:195:5] {
k=j+5
range=sprintf("%d-%d", j, k)
A(a) = (0.95 - 0.05)/pi*(atan(a)+pi/2) + 0.05
B(b) = (0.95 - 0.05)/pi*(atan(b)+pi/2) + 0.05
K1(k1) = sqrt(k1*k1)
K2(k2) = sqrt(k2*k2)
f(x)=A(a)*exp(-K1(k1)*x)+(B(b))*exp(-K2(k2)*x)


a=0.5
b=0.5
k1=0.1
k2=0.01
fit f(x) dppc_dir.'Carb_ACF/'.range.'_acf.xvg' u 1:2 via k1,k2,a,b
print sprintf("%f\t%f\t%f\t%f\t%f\t%f\t%f", j, A(a), B(b), K1(k1) > K2(k2) ? K1(k1) : K2(k2), K1(k1) < K2(k2) ? K1(k1) : K2(k2), K1(k1) > K2(k2) ? 1.0/K1(k1) : 1.0/K2(k2), K1(k1) < K2(k2) ? 1.0/K1(k1) : 1.0/K2(k2))
#print sprintf("%f\t%f\t%f", i*0.2, K1(k1) > K2(k2) ? 1.0/K1(k1) : 1.0/K2(k2), K1(k1) < K2(k2) ? 1.0/K1(k1) : 1.0/K2(k2))

}
