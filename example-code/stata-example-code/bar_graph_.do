/*
This provides example code of how to generate different types of bar charts.

The two commands that generate bar graphs are "twoway(bar... )" and "graph bar ...".

The "graph export" command can be used to export the graph as a pdf or png.

The "///" is used to break the lines of code but can still be run together.
*/

net install scheme-modern, from("https://raw.githubusercontent.com/mdroste/stata-scheme-modern/master/")


*Load the example dataset
sysuse auto, clear

*These set the figure scheme to modern and applies Times New Roman font
set scheme modern, perm
graph set window fontface "Times New Roman"


/** TWOWAY BAR **/

* This method works only if you encode the categorical variable as numeric so it can exist on the x axis.
* Single bars (price) per category of car origin (foreign vs domestic).
* Bar arguments preceded by a "b", e.g., "bcolor" or "bwidth".
twoway (bar price foreign if foreign==0, bcolor(blue) barwidth(0.6) base(0)) ///
      (bar price foreign if foreign==1, bcolor(red) barwidth(0.6) base(0)), ///
    legend(off) ///
    ytitle("Average Price (USD)", size(large)) ///
    ylabel(0(2000)16000, labsize(medium)) ///
    xtitle("Car Origin", size(large) margin(medium)) ///
    xlabel(0 "Domestic" 1 "Foreign", labsize(medium)) xsize(5)

graph export "auto_price_by_origin_twoway.png", as(png) name("Graph") replace




/** GRAPH BAR **/

*EXAMPLE 1: Multiple bars for a SINGLE category
* The bar(1, ..), bar(2, ...) arguments allow you to format/color individual bars.
graph bar weight length mpg if foreign==0, ///
    bar(1, color(gs7)) bar(2, color(maroon)) bar(3, color(navy)) ///
    legend(on) legend(order(1 "Weight" 2 "Length" 3 "MPG")) legend(position(6) rows(1)) legend(size(medium)) ///
    yline(0) ytitle("Car Attributes", size(large)) ylabel(#5, labsize(medium)) ///
    title("Attributes for Domestic Cars", size(large))

graph export "auto_domestic_attributes_bar.pdf", as(pdf) name("Graph") replace




* EXAMPLE 2: Multiple bars bunched together for a single category BUT multiple categories displayed
* The "over(<categorical_var>, ...)" allows multiple categories to be displayed on the same graph.
graph bar price weight, ///
    over(foreign, relabel(0 "Domestic" 1 "Foreign") label(labsize(medium))) ///
    legend(on) legend(order(1 "Price" 2 "Weight")) legend(position(6) rows(1)) legend(size(medium)) ///
    ytitle("Values", size(large)) ylabel(#5, labsize(medium)) ///
    title("Price and Weight by Car Origin", size(large))

graph export "auto_price_weight_by_origin.png", as(png) name("Graph") replace
