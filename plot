set terminal pngcairo size 700,525
png=file[0:strlen(file)-3]."png"
print "Saving to ",png
set output png
set xlabel 'cores'
set ylabel 'rate (kpps)'
set grid
set datafile separator tab
set xrange [0:9]
set key left
colors='#3182bd #de2d26'
plot for [col=0:1] file using 1:col*3+2:xtic(1) with lines title columnheader linecolor rgb word(colors, col+1), \
     for [col=0:1] '' using 1:col*3+2:col*3+3:col*3+4 with yerrorbars linetype col+1 linecolor rgb word(colors, col+1) notitle
