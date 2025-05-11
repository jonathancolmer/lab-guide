/*
This provides example code of how to generate different types of histograms.

Histograms are created using the "histogram" command in Stata.

The "graph export" command can be used to export the graph as a pdf or png.

The "///" is used to break the lines of code but can still be run together.
*/

net install scheme-modern, from("https://raw.githubusercontent.com/mdroste/stata-scheme-modern/master/")


*Load the example dataset
sysuse auto, clear

*These set the figure scheme to modern and apply Times New Roman font
set scheme modern, perm
graph set window fontface "Times New Roman"


/** HISTOGRAM EXAMPLE 1: Simple Histogram **/

* Basic histogram of car prices
histogram price, ///
    bin(15) ///
    color(navy) ///
    ytitle("Frequency", size(large)) ylabel(#5, labsize(medium)) ///
    xtitle("Price (USD)", size(large) margin(medium)) xlabel(0(2000)16000, labsize(medium)) ///
    title("Distribution of Car Prices", size(large)) xsize(8.6)

graph export "auto_price_histogram_simple.pdf", as(pdf) name("Graph") replace




/** HISTOGRAM EXAMPLE 2: Overlay Normal Curve **/

* Histogram of car weight with normal distribution overlaid
histogram weight, ///
    bin(20) ///
    normal ///
    color(maroon) ///
    ytitle("Density", size(large)) ylabel(#5, labsize(medium)) ///
    xtitle("Car Weight (lbs)", size(large) margin(medium)) xlabel(1500(500)5000, labsize(medium)) ///
    title("Distribution of Car Weights with Normal Fit", size(large)) xsize(8.6)

graph export "auto_weight_histogram_normal.pdf", as(pdf) name("Graph") replace
