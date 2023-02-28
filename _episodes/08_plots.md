---
layout: page
title: Plots
order: 8
session: 3
length: 20
toc: true
adapted: false
attrib_name: Programming with R
attrib_link: https://github.com/swcarpentry/r-novice-inflammation
attrib_copywrite: Software Carpentry
attrib_license: CC-BY 4.0
attrib_license_link: https://creativecommons.org/licenses/by/4.0/
---

As R is often considered the go to language for both data analysis and visualisation. R is capable of plotting many 
different types of plots and many are possible through simple plotting techniques. Depending on the data we are 
attempting to visualize, the type of plot we may want to use will vary. R will automatically try and plot the most 
appropriate plot for the data provided. You can also define to make box plots (boxplot()), histograms (hist()) and bar plots (barplot()).

There are also many arguments we can give to R for the plots we want to make.


{% highlight r %}
# Plotting all the iris data
plot(iris, col = c("red", "blue", "#ddaa33")[as.numeric(iris$Species)], 
     pch = c(1, 2, 3)[as.numeric(iris$Species)], cex = 0.8)
{% endhighlight %}

![plot of chunk plot](/../figure/rmarkdown/08_plots/plot-1.png)

Box plots can be made using the ```boxplot()``` function. It uses a lot of the standard plotting functions.


{% highlight r %}
plot(iris$Sepal.Length ~ iris$Species, ylab = "Sepal Length (cm)", xlab = "Species", 
     col =  c("red", "blue", "#ddaa33"))
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/../figure/rmarkdown/08_plots/unnamed-chunk-1-1.png)

Histograms are plotted using the function ```hist()```, which allows us to plot the frequency of a vector. You can use standard plotting arguments such as col, but also used the argument breaks to adjust the amount of bins.


{% highlight r %}
# Plotting "Sepal.Length" with increased bins
hist(iris$Sepal.Length, breaks = 16)
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/../figure/rmarkdown/08_plots/unnamed-chunk-2-1.png)

Below you can see a table containing a lot of basic plotting arguments. Also, for colour selection, making colour themes and looking for colour blind options, you can use https://www.colorhexa.com/ which will give you R friendly colour codes.


{% highlight text %}
## Warning in file(file, "rt"): cannot open file 'plotting table.csv': No such
## file or directory
{% endhighlight %}



{% highlight text %}
## Error in file(file, "rt"): cannot open the connection
{% endhighlight %}



{% highlight text %}
## Error in knitr::kable(plots, col.names = gsub("[.]", " ", names(plots))): object 'plots' not found
{% endhighlight %}

***

**Plots on plots**

Once you have created a plot, there are various methods which allow us to add more data on top. For example, we may want to add a individual data points on top of a box plot, or extra points to a plot. To do this we can use functions such as points(), lines() or abline().

Using points() and lines(), you can add more data to your plot. They use similar arguments to plot(), such as col, lty, pch, cex etc.


{% highlight r %}
# Plot "Sepal.Length" on a plot, then add "Sepal.Width" data as points and "Petal.Length" as lines
plot(iris$Sepal.Length, ylim = c(0, 8), ylab = "Size (cm)", xlab = "Sample")
points(iris$Sepal.Width, col = "red", pch = 19, cex = 0.8)
lines(iris$Petal.Length, lty = 2, col = "blue")
{% endhighlight %}

![plot of chunk unnamed-chunk-4](/../figure/rmarkdown/08_plots/unnamed-chunk-4-1.png)

using abline(), you can add horizontal lines (h=), vertical lines (v=), diagonal or correlations (x, y). It can also be wrapped around a linear regression (lm()) to add a line of best fit.


{% highlight r %}
# Adding a horizontal line at 6 and a vertical line at 60
plot(iris$Sepal.Length)
abline(h = 6, col = "red")
abline(v = 60, col = "blue")
{% endhighlight %}

![plot of chunk unnamed-chunk-5](/../figure/rmarkdown/08_plots/unnamed-chunk-5-1.png)

{% highlight r %}
# Plotting "Sepal.Length" against "Petal.Length" and adding a line of best fit
plot(iris$Sepal.Length ~ iris$Petal.Length)
abline(lm(iris$Sepal.Length ~ iris$Petal.Length), lty = 3, col = "green", lwd = 3)
{% endhighlight %}

![plot of chunk unnamed-chunk-5](/../figure/rmarkdown/08_plots/unnamed-chunk-5-2.png)

***

**Plot additions**

We can make many additions to our plots. As there are so many, we will only explore the most common ones here but will list additional ones which may be useful in the future. 


We often need to add a legend to our plot, and can do this using legend(). The legend() function allows us to define position, either by using x, y coordinates or position such as "topleft". We also provide the text, colours and background.


{% highlight r %}
# Plotting "Sepal.Length" and colouring and using different points by "Species", then adding a legend
plot(iris$Sepal.Length, col = c("red", "blue", "#ddaa33")[as.numeric(iris$Species)], 
     pch = c(1, 2, 3)[as.numeric(iris$Species)])
legend("topleft", legend = c("Setosa", "Versicolor", "Virginica"), 
       pch = c(1,2,3), col = c("red", "blue", "#ddaa33"))
{% endhighlight %}

![plot of chunk unnamed-chunk-6](/../figure/rmarkdown/08_plots/unnamed-chunk-6-1.png)

We can add additional text to a plot by using text() or mtext() for putting text in the margin. To use text(), we provide x, y coordinates, the text to be written (labels =), size (cex =), and colour (col =) and font (font =). 

Using mtext() requires different arguments as it is relation to the margin side we put the text in. It requires the text (text = ), the side of the plot the text will go (side =) with 1 = bottom, 2 = left, 3 = top, 4 = right, the margin line to put the text on (line = ).


{% highlight r %}
# Adding text to a plot
plot(iris$Sepal.Length)
text(20, 6, "text", cex = 0.7, col = "blue", font = 2)
mtext("text", side = 4, line = 1, col = "red")
{% endhighlight %}

![plot of chunk unnamed-chunk-7](/../figure/rmarkdown/08_plots/unnamed-chunk-7-1.png)

There are incidences when we may want to add additional axes or move and adjust the axes of a plot. For this, we use axis(), and may add the argument to plot() to remove axes from our plot (axes = F) so we can draw them. Arguments for axis() are which side you want the axis (side =) using 1 = below, 2 = left, 3 = above and 4 = right, the point at which tick-marks are drawn (at =), what the labels are (labels =), how far from the axis the ticks should extend (line =), the position of the axis (pos =) and if tick marks should be drawn (tick =). You can also change the line width (lwd =), colour (col =) and type of line (lty =).


{% highlight r %}
# Plotting "Sepal.Length" without axes and adding them with adjustment
plot(iris$Sepal.Length, axes = F, ylab="Sepal Length (cm)")
axis(1)
axis(2, pos = 50, at = 1:8, lwd = 2, col = "blue")
{% endhighlight %}

![plot of chunk unnamed-chunk-8](/../figure/rmarkdown/08_plots/unnamed-chunk-8-1.png)

Additional functions to add to your plots are segments(), arrows(), curve(), rect(), polygon() and grid().

***

**Margins ** 

Using par(), mar() and mgp() before the plot, we can adjust the margins of our plot. Using mar() allows us to adjust the margins giving the number of lines of margin, with the default being c(5, 4, 4, 2) + 0.1 relating to bottom, left, top and right respectively. 

Using mgp() sets the axis label locations relative to the edge of the inner plot window. The first value represents the location the axis label, the 2nd the tick-mark labels, and 3rd the tick marks. The default is c(3, 1, 0).

Using las() allows us to define the orientation of the tick mark labels and any other text added to a plot. The options are parallel to the axis (the default, 0), always horizontal (1), always perpendicular to the axis (2), and always vertical (3).


{% highlight r %}
par(mar = c(4, 4, 2, 1), mgp = c(2, 0.5, 0), las = 1)
plot(iris$Sepal.Length, ylab="Sepal Length (cm)")
{% endhighlight %}

![plot of chunk unnamed-chunk-9](/../figure/rmarkdown/08_plots/unnamed-chunk-9-1.png)

***

**Composites **

There are two options for making composite plots, or plots with multiple plots as panels. These are par(mfrow/mfcol =) and layout().

The arguments for par(mfrow/mfcol =), allows us to define how many rows and columns to make the composite of. Using mfcol draws by columns and mfrow draws by rows.


{% highlight r %}
par(mar = c(4, 4, 2, 1))
par(mfrow = c(1, 2))
plot(iris$Sepal.Length, ylab="Sepal Length (cm)")
plot(iris$Sepal.Width, ylab="Sepal Width (cm)")
{% endhighlight %}

![plot of chunk unnamed-chunk-10](/../figure/rmarkdown/08_plots/unnamed-chunk-10-1.png)

The arguments for layout() are more complicated but allows for unequal sizes of composite sections. The matrix argument allows you to define what plots (in the order of plotting under the layout function). The following two numbers are the number of rows and columns in our composite, respectively. The byrow argument, if true, will add plots by row, if false, it will add by column.


{% highlight r %}
par(mar = c(4, 4, 2, 1))
layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE))
plot(iris$Sepal.Length, ylab = "Sepal Length (cm)")
plot(iris$Sepal.Width, ylab = "Sepal Width (cm)")
plot(iris$Petal.Length, ylab = "Petal Length (cm)")
{% endhighlight %}

![plot of chunk unnamed-chunk-11](/../figure/rmarkdown/08_plots/unnamed-chunk-11-1.png)

***

**Saving and exporting plot**

We can save our plots as various formats using the appropriate function. These include pdf (pdf()), jpeg (jpeg()), png (png()) and tiff (tiff()). These functions, with their arguments, will appear before the plot information, and will be succeeded by dev.off(). The first argument for any of these functions should be the path and file name to save the file under. You can also define the size of the image (width =, height =, units =), background colour (bg =) and resolution (res =).  


{% highlight r %}
# Saving a plot as a jpeg file
jpeg("exampleplot.jpg", width = 300, height = 300, units = "mm", bg = "white", res = 200)
plot(iris$Sepal.Length, ylab = "Sepal Length (cm)")
dev.off()
{% endhighlight %}



{% highlight text %}
## png 
##   2
{% endhighlight %}

***

### <a id="tasks3"></a>Tasks

1. Make two objects, one object containing values 1-20, and another object containing values 40-21
    a. Using your objects, create a plot with the object containing 1:20 on the x-axis and the object containing 40-21 on y-axis
    b. Change the x-axis label to "Independent Variable" and y-axis label to "Dependent Variable"
    c. Expand both axes to show values 1-40
    d. Increase the data point size, change their style and make them repeat between five colours
    e. Add a legend top the top right of the plot showing the five colours you have chosen and labelling them A, B, C, D, and E
    f. Add a horizontal line at 30, choose a colour, weight and style
    g. Add a vertical line at 10, choose a different colour, weight and style
    h. Add text saying "Cross Point" to the top right of the intersection of the two lines. Adjust the colour and size
<p>&nbsp;</p>

2. Using "iris", create a scatter plot with "Sepal.Length" on x-axis, labelled "Sepal length (cm)", and the other three variables plotted on y-axis, with the label being "Size (cm)"
    a. Colour the three species differently and make the three measures different style of points 
    b. Add a legend to show all the groups, and make sure it doesn't cover any points
    c. Make sure the x-axis limits are 0-8 and y-axis limit is 4-8
    d. Adjust the margins to give a larger space around the edge of the plot and move the axis labels a little away from the axes
    e. Export the image as a pdf
<p>&nbsp;</p>

3. Create a composite plot with the following panels using "iris". Make the plots colourful and variable, that all points are visible in plotting window, axes have labels and measurement units. Export the plot as a high resolution (200) jpeg. Make sure the points and text are readable, and all info is visible. You may need to adjust margins
    a. Box plot of "Petal.Length" by species coloured by species
    b. Histogram of "Petal.Length" with 6 breaks, each one coloured differently, with a line added for the mean (hint: mean), coloured and labelled "Mean = X" where "X" is the mean value. Make this panel take more space
    c. "Petal.Length" against "Petal.Width" for just "virginica" species, with a line of best fit (hint: subsetting)
