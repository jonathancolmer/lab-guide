/*
This provides examples of previous code using line graphs.

Most line graphs use the "twoway" command.
The order of variables is y-axis-var then x-axis-var.

The "graph export" command can be used to export the graph as a pdf or png.

The "///" is used to break the lines of code but can still be run together.
*/

net install scheme-modern, from("https://raw.githubusercontent.com/mdroste/stata-scheme-modern/master/")

*Load the example dataset
sysuse auto, clear

*These set the figure scheme to modern and applies Times New Roman font
set scheme modern, perm
graph set window fontface "Times New Roman"


*Sort dataset by x-variable before line plotting
sort weight

/** EXAMPLE 1: Line with regression fit **/

*This formats the variable so it is not in scientific notation
format %10.0fc price

*Plot price on the y-axis, weight on the x-axis, with a regression fit line
*Line arguments being with "l", e.g. lpattern
twoway (line price weight, lwidth(0.7) lcolor(gs7)) ///
      (lfit price weight, lwidth(0.7) lpattern(dash) lcolor(maroon)), ///
    legend(off) legend(position(6) rows(1)) legend(size(medium)) ///
    xlabel(1500(500)5000, labsize(medium) angle(45)) xtitle("Car Weight (lbs)", margin(medium) size(large)) xsize(8.6) ///
    ylabel(#5, labsize(medium)) ytitle("Car Price (USD)", size(large)) ///
    title("Car Price vs Weight with Fit Line", size(large))

graph export "auto_price_weight_linefit.pdf", as(pdf) name("Graph") replace



/** EXAMPLE 2: Two lines marked by a legend **/

*Line plot of price vs weight separately for domestic and foreign cars
twoway (line price weight if foreign==0, lwidth(0.7) lcolor(navy)) ///
      (line price weight if foreign==1, lwidth(0.7) lcolor(maroon)), ///
    legend(on) legend(order(1 "Domestic" 2 "Foreign")) legend(position(6) rows(1)) legend(size(medium)) ///
    xlabel(1500(500)5000, labsize(medium) angle(45)) xtitle("Car Weight (lbs)", margin(medium) size(large)) xsize(8.6) ///
    ylabel(#5, labsize(medium)) ytitle("Car Price (USD)", size(large)) ///
    title("Price vs Weight by Car Origin", size(large))

graph export "auto_price_weight_by_origin.pdf", as(pdf) name("Graph") replace
