/*

This provides example code of how to generate a scatter plot and export as a pdf.

The command is "twoway" for the scatter plot and "graph export" for exporting.

There is a standard scatter plot and a "binscatter" version.
The binscatter2 command puts the data into quantile bins before plotting the scatter points.
A binscatter is appealing if there are too many points in a normal scatter plot. 

The "///" is used to break the lines of code but can still be run together. 

*/

ssc install gtools
net install binscatter2, from("https://raw.githubusercontent.com/mdroste/stata-binscatter2/master/")

net install scheme-modern, from("https://raw.githubusercontent.com/mdroste/stata-scheme-modern/master/")

*Load the example data set
sysuse auto, clear

*These set the figures scheme to modern and applies Times New Roman font
set scheme modern, perm
graph set window fontface "Times New Roman"


/** STANDARD SCATTER PLOT **/
*The "dot" arguments have an "m" before them (e.g. mcolor() or msize() )
*Plot price vs weight by foreign status (domestic/foreign)
twoway (scatter price weight if foreign==0, msize(2.0) mcolor(blue)) ///
       (scatter price weight if foreign==1, msize(2.0) mcolor(red)), ///
    ytitle("Car Price (USD)", size(large)) ylabel(0(2000)16000, labsize(medium)) ///
    xtitle("Car Weight (lbs)", margin(medium) size(large)) xlabel(, labsize(medium)) xsize(8.6) ///
    legend(on) legend(order(1 "Domestic" 2 "Foreign") size(medium)) legend(position(6) rows(1)) ///
    title("Price vs Weight by Car Origin", size(large))

graph export "auto_price_weight_scatter.pdf", as(pdf) name("Graph") replace


/** BINSCATTER **/
*n(10) indicates 10 quantile bins
binscatter2 price weight if foreign==0, n(10) ///
    msize(2.0) mcolor(blue) ///
    ytitle("Car Price (USD)", size(large)) ylabel(0(2000)16000, labsize(medium)) ///
    xtitle("Car Weight (lbs)", margin(medium) size(large)) xlabel(, labsize(medium)) xsize(8.6) ///
    legend(off) ///
    title("Binned Scatter: Domestic Cars", size(large))






