
***********************************
* Homework 1
***********************************
* Instructions: 
* To create this document, first copy and paste the full text here into a .Do document (a STATA Do-File).
* Below each question, write the code you used to answer the question
* Next, write your actual answer to the question by commenting out your writing (by starting the line with a *)
* Next, copy and paste the entire document (my writing and yours) into a Word document. This will allow me to see your code on Canvas without downloading every homework.
* The goal is that I should be able to copy and paste your entire text into a .Do File and run the code without any errors.
* Finally, submit file as Homework 1 on Canvas



***********************************
* Topic 1: Using STATA
***********************************

* 1. Import the AssetReuturns file

import excel "/Users/henryvelasquez/Documents/MBA/MBA S3/2nd 7/Machine Learnin
> g in Finance K579/HW1/AssetReturns.xlsx", sheet("Sheet1") firstrow case(lower)

* 2. Save File as Homework1

/*Pressed CTRL+S*/

* 3. Estimate the Mean, Minimum, and Maximum of Annual S&P500 Returns

codebook annualreturnsp500
/*
Mean:.118206
Minimum: -.4384
Maximum: .5256
*/

* 4. Estimate the 25th and 75th percentile of Annual S&P 500 Returns

/*
25th Percentile: -.0119
75th Percentile: .2594
*/

* 5. Estimate the variance of Annual Return in Treasury Bonds in 1992-2002 (including 1992 and 2002)

summarize annualreturntbonds if year >= 1992 & year <= 2002

/*
Variance = stddev^2 = .101196^2 = .01024
WOULD LOVE TO LEARN HOW TO PROPERLY USE COLLAPSE TO STORE STATISTICS IN VARIABLES
*/

* 6. Estimate the median of Annual Returns on Real Estate when Annual S&P500 Returns are positive

codebook annualreturnrealestate if annualreturnrealestate > 0

/*
50th Perecntile Value = Median = .1364
*/


* 7. Estimate mean Annual Corporate Bonds Returns when years are less than 1945 or year are between 2008 and 2012 (including 2008 and 2012)

codebook annualreturncorporatebonds if year < 1945 | year <= 2012 & year >= 2008

/* Mean = .075786 */

* 8. How many times is inflation exactly 0 (Hint: use tabulate)

tabulate inflationrate
/* inflation is 0 ONLY ONCE */

***********************************
* Topic 2: Graphing in STATA
***********************************

* 9. Create a histogram of Inflation with a 2% bar width

hist inflationrate, normal width(.02)

* 10. Create a box plot of Returns for all Assets
* Based on the graph, which asset has the greatest highs? The greatest lows?

graph box annualreturnsp500 annualreturntbills annualreturntbonds annualreturncorporatebonds annualreturnrealestate

/* According to the graph, the S&P500 has the greatest highs and lows */

* 11. Create a Scatter plot with inflation as the x-variable and annual real estate returns as the y-variable.
*Does Real Estate pay well when inflation is high or low? Why?

twoway(scatter annualreturnrealestate inflationrate)(lowess inflationrate annualretunrealestate)
/*
Real estate does tend to pay higher as inflation rates increase. This can be seen by the upward slope of the best fit line.
*/


* 12. Create a two-way layered graphic with both a scatter plot and a linear fit. The y-variable is Corporate Bond Returns and the x-variable is Treasury Bonds Returns


twoway(scatter annualreturncorporatebonds annualreturntbonds)(lowess annualreturntbonds annualreturncorporatebonds)


