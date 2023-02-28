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

The mathematician Richard Hamming once said, “The purpose of computing is insight, not numbers,” and the best way 
to develop insight is often to visualize data. Visualization deserves an entire lecture (or course) of its own, 
but we can explore a few of R’s plotting features. R is synonymous with data analysis and visualisation. R is capable of plotting many 
different types of plots and importantly these are infinitely customisable. To mke a plot look the way we want,
we need to take advantage of the many arguments available in plotting functions. 

The R base function ```plot()``` can generate a range of different plots from some user supplied data. 

If we provide one vector of continous data, it plots that on the y-axis against the index on the x-axis.


{% highlight r %}
plot(iris$Sepal.Length)
{% endhighlight %}

![plot of chunk unnamed-chunk-1](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-1-1.png)

If we want to plot a scatterplot between two continuous variables, we provide both to the function. The order here can be important, if not 
explicitly labeled as the x or y variable, R will take the first entry as the x variable and the second entry as the y variable. 


{% highlight r %}
plot(iris$Sepal.Length, iris$Sepal.Width)
{% endhighlight %}

![plot of chunk unnamed-chunk-2](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-2-1.png)

Alternatively we can use the argument keywords to specify which variable should be plotted on which axis, in this case is doesn't matter which order we
include the arguments. For example we can state the y variable first. 


{% highlight r %}
plot(y = iris$Sepal.Length, x = iris$Sepal.Width)
{% endhighlight %}

![plot of chunk unnamed-chunk-3](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-3-1.png)

You will see that R has generated the axis labels from the variable names. We can customise this with additional arguments (```xlab``` and ```ylab```) in the function.

{% highlight r %}
plot(iris$Sepal.Length, iris$Sepal.Width , xlab = "Sepal Length (cm)", ylab = "Sepal Width (cm)")
{% endhighlight %}

![plot of chunk unnamed-chunk-4](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-4-1.png)

We can also change the colour of the points with the ```col``` argument. If we give it one colour, all the points will be changed to the same colour.



{% highlight r %}
plot(iris$Sepal.Length, iris$Sepal.Width , xlab = "Sepal Length (cm)", ylab = "Sepal Width (cm)", col = "red")
{% endhighlight %}

![plot of chunk unnamed-chunk-5](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-5-1.png)

Alternatively, we can provide a vector of colours, where the first colour will be the colour of the first point drawn, the second colour, the colour of the second point and so on. 
This vector does have to be the same length as the number of points. For example if we provide a vector of three colours, this will recycled until all the points have been pointed. 


{% highlight r %}
plot(iris$Sepal.Length, iris$Sepal.Width , xlab = "Sepal Length (cm)", ylab = "Sepal Width (cm)", col = c("red", "blue", "#ddaa33"))
{% endhighlight %}

![plot of chunk unnamed-chunk-6](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-6-1.png)

What has happened is the 1st,4th,7th etc are pointed in red, the 2nd,5th,8th etc in blue and the 3rd,6th,9th etc in #ddaa33.

If we want to colour the points by some categorial variable, we can use the fact that factors are represented as integers to subset a vector of colours.


{% highlight r %}
plot(iris$Sepal.Length, iris$Sepal.Width , xlab = "Sepal Length (cm)", ylab = "Sepal Width (cm)", col = c("red", "blue", "#ddaa33")[iris$Species])
{% endhighlight %}

![plot of chunk unnamed-chunk-7](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-7-1.png)

There are three levels in the factor ```iris$Species```, which are represent internal by the numbers 1,2,3. These integers can be used to index a vector of at 
least three as shown below, and create a new vector, where each level is replaced by the same colour.


{% highlight r %}
iris$Species[1:10]
{% endhighlight %}



{% highlight text %}
##  [1] setosa setosa setosa setosa setosa setosa setosa setosa setosa setosa
## Levels: setosa versicolor virginica
{% endhighlight %}



{% highlight r %}
as.numeric(iris$Species[1:10])
{% endhighlight %}



{% highlight text %}
##  [1] 1 1 1 1 1 1 1 1 1 1
{% endhighlight %}



{% highlight r %}
c("red", "blue", "#ddaa33")[iris$Species[1:10]]
{% endhighlight %}



{% highlight text %}
##  [1] "red" "red" "red" "red" "red" "red" "red" "red" "red" "red"
{% endhighlight %}

Depending on the data we are 
attempting to visualize, the type of plot we may want to use will vary. R will automatically try and plot the most 
appropriate plot for the data provided. Here we use a "~" to provide a formula denoting what we want to plot. As ```iris$Species``` is a factor,
R defaults to a boxplot.


{% highlight r %}
plot(iris$Sepal.Length ~ iris$Species, ylab = "Sepal Length (cm)", xlab = "Species", 
     col =  c("red", "blue", "#ddaa33"))
{% endhighlight %}

![plot of chunk unnamed-chunk-9](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-9-1.png)

Note here, we only need to provide a vetcor of three colours, as there are only three boxes in the figure. 

As well as the ```plot()``` function R has some spcific plot functions (box plots (boxplot()), histograms (hist()) and bar plots (barplot())). They use a lot of the same arguments.

For example we can recreate the same boxplot as follows


{% highlight r %}
boxplot(iris$Sepal.Length ~ iris$Species, ylab = "Sepal Length (cm)", xlab = "Species", 
     col =  c("red", "blue", "#ddaa33"))
{% endhighlight %}

![plot of chunk unnamed-chunk-10](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-10-1.png)

Histograms are plotted using the function ```hist()```, which allows us to plot the frequency of a vector. You can use standard plotting arguments such as col, but also used the 
argument breaks to adjust the amount of bins.


{% highlight r %}
# Plotting "Sepal.Length" with increased bins
hist(iris$Sepal.Length, breaks = 16)
{% endhighlight %}

![plot of chunk unnamed-chunk-11](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-11-1.png)

Below you can see a table containing a lot of basic plotting arguments. Also, for colour selection, making colour themes and looking for colour blind options, you can use https://www.colorhexa.com/ which will give you R friendly colour codes.


|Argument   |Description                                                              |Example                      |
|:----------|:------------------------------------------------------------------------|:----------------------------|
|bg         |The color to be used for the background                                  |bg = "blue"                  |
|cex        |Character size and expansion                                             |cex = 1.5, cex = 0.8         |
|cex.axis   |The magnification to be used for axis annotation                         |cex.axis = 1.2               |
|cex.lab    |he magnification to be used for x and y label                            |cex.lab = 0.8                |
|cex.main   |The magnification to be used for main titles                             |cex.main = 1.3               |
|cex.sub    |The magnification to be used for sub-titles                              |cex.sub = 0.9                |
|col        |Colour                                                                   |col = "red", col = "#ff0000" |
|family     |Font on the plot                                                         |family = "Arial"             |
|fg         |The colour to be used for the foreground of plots                        |fg = "orange"                |
|font       |An integer which specifies which font to use for text. Italic, bold etc. |font = 3                     |
|font.axis  |The font to be used for axis annotation                                  |font.axis = 2                |
|font.lab   |The font to be used for x and y labels                                   |font.lab = 3                 |
|font.main  |The font to be used for plot main titles                                 |font.main = 2                |
|font.sub   |The font to be used for plot sub-titles                                  |font.sub = 2                 |
|lty        |Line type                                                                |lty = 2                      |
|lwd        |Line width                                                               |lwd = 3                      |
|main       |Plot primary title                                                       |main = "Iris"                |
|pch        |Scatter plot symbol for points                                           |pch = 1, pch= "p"            |
|srt        |The string rotation in degrees                                           |srt = 90                     |
|sub        |Subtitle of plot                                                         |sub = "All data"             |
|xlab, ylab |Label of the x or y axis                                                 |xlab = "Distance (Miles)"    |
|xlim, ylim |Min/max x or y axis values                                               |xlim = c(0, 10)              |
|xpd        |If true, allows plotting outside the plot                                |xpd = TRUE                   |


# Plots on plots

Once you have created a, there are various methods which allow us to add more data on top. For example, we may want to add a individual data points on top of a box, or extra points to a plot. To do this we can use functions such as points(), lines() or abline().

Using ```points()``` and ```lines()```, you can add more data to your plot. They use similar arguments to ```plot()```, such as col, lty, pch, cex etc.


{% highlight r %}
# Plot "Sepal.Length" on a, then add "Sepal.Width" data as points and "Petal.Length" as lines
plot(iris$Sepal.Length, ylim = c(0, 8), ylab = "Size (cm)", xlab = "Sample")
points(iris$Sepal.Width, col = "red", pch = 19, cex = 0.8)
lines(iris$Petal.Length, lty = 2, col = "blue")
{% endhighlight %}

![plot of chunk unnamed-chunk-13](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-13-1.png)

using ```abline()```, you can add horizontal lines (```h=```), vertical lines (```v=```), or diagonal lines(x, y). You can also specify
 the parameters of the straight line i.e the intercept (```a=```) and slope coefficient (```b=```).

It can also be wrapped around a linear regression (```lm()```) to add a line of best fit.


{% highlight r %}
# Adding a horizontal line at 6 and a vertical line at 60
plot(iris$Sepal.Length)
abline(h = 6, col = "red")
abline(v = 60, col = "blue")
{% endhighlight %}

![plot of chunk unnamed-chunk-14](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-14-1.png)

{% highlight r %}
# Plotting "Sepal.Length" against "Petal.Length" and adding a line of best fit
plot(iris$Sepal.Length ~ iris$Petal.Length)
abline(lm(iris$Sepal.Length ~ iris$Petal.Length), lty = 3, col = "green", lwd = 3)
{% endhighlight %}

![plot of chunk unnamed-chunk-14](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-14-2.png)


# Adding to a Plot

We can make many additions to our plots. As there are so many, we will only explore the most common ones here but will list additional ones which may be useful in the future. 


We often need to add a legend to our, and can do this using ```legend()```. The ```legend()``` function allows us to define position, either by using x, y coordinates or by a word
 such as "topleft". We also provide the text, colours and background.


{% highlight r %}
# Plotting "Sepal.Length" and colouring and using different points by "Species", then adding a legend
plot(iris$Sepal.Length, col = c("red", "blue", "#ddaa33")[iris$Species], 
     pch = c(1, 2, 3)[iris$Species])
legend("topleft", legend = c("Setosa", "Versicolor", "Virginica"), 
       pch = c(1,2,3), col = c("red", "blue", "#ddaa33"))
{% endhighlight %}

![plot of chunk unnamed-chunk-15](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-15-1.png)

We can add additional text to a plot by using ```text()``` or ```mtext()``` for putting text in the margin. To use ```text()```, we provide x, y coordinates, 
the text to be written (```labels =```), size (```cex =```), and colour (```col =```) and font (```font =```). 

Using ```mtext()``` requires different arguments as it is relation to the margin side we put the text in. It requires the text (```text = ```), the side of the plot 
the text will go (side =) with 1 = bottom, 2 = left, 3 = top, 4 = right, the margin line to put the text on (line = ).


{% highlight r %}
# Adding text to a plot
plot(iris$Sepal.Length)
text(20, 6, "text", cex = 0.7, col = "blue", font = 2)
mtext("text", side = 4, line = 1, col = "red")
{% endhighlight %}

![plot of chunk unnamed-chunk-16](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-16-1.png)

There are incidences when we may want to add additional axes or move and adjust the axes of a plot. For this, we use ```axis()```, and may add the argument to ```plot()``` to remove axes from our plot (axes = F) so we can draw them. Arguments for axis() are which side you want the axis (side =) using 1 = below, 2 = left, 3 = above and 4 = right, the point at which tick-marks are drawn (at =), what the labels are (labels =), how far from the axis the ticks should extend (line =), the position of the axis (pos =) and if tick marks should be drawn (tick =). You can also change the line width (lwd =), colour (col =) and type of line (lty =).


{% highlight r %}
# Plotting "Sepal.Length" without axes and adding them with adjustment
plot(iris$Sepal.Length, axes = F, ylab="Sepal Length (cm)")
axis(1)
axis(2, pos = 50, at = 1:8, lwd = 2, col = "blue")
{% endhighlight %}

![plot of chunk unnamed-chunk-17](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-17-1.png)

Additional functions to add to your plots are ```segments()```, ```arrows()```, ```curve()```, ```rect()```, ```polygon()``` and ```grid()```.

# Plotting Margins 

Using par(), mar() and mgp() before the, we can adjust the margins of our plot. Using mar() allows us to adjust the margins giving the number of lines of margin, with the default being c(5, 4, 4, 2) + 0.1 relating to bottom, left, top and right respectively. 

Using mgp() sets the axis label locations relative to the edge of the inner plot window. The first value represents the location the axis label, the 2nd the tick-mark labels, and 3rd the tick marks. The default is c(3, 1, 0).

Using las() allows us to define the orientation of the tick mark labels and any other text added to a plot. The options are parallel to the axis (the default, 0), always horizontal (1), always perpendicular to the axis (2), and always vertical (3).


{% highlight r %}
par(mar = c(4, 4, 2, 1), mgp = c(2, 0.5, 0), las = 1)
plot(iris$Sepal.Length, ylab="Sepal Length (cm)")
{% endhighlight %}

![plot of chunk unnamed-chunk-18](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-18-1.png)

# Creating Composite Plots

There are two options for making composite plots, or plots with multiple plots as panels. These are par(mfrow/mfcol =) and layout().

The arguments for par(mfrow/mfcol =), allows us to define how many rows and columns to make the composite of. Using mfcol draws by columns and mfrow draws by rows.


{% highlight r %}
par(mar = c(4, 4, 2, 1))
par(mfrow = c(1, 2))
plot(iris$Sepal.Length, ylab="Sepal Length (cm)")
plot(iris$Sepal.Width, ylab="Sepal Width (cm)")
{% endhighlight %}

![plot of chunk unnamed-chunk-19](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-19-1.png)

The arguments for layout() are more complicated but allows for unequal sizes of composite sections. The matrix argument allows you to define what plots (in the order of plotting under the layout function). The following two numbers are the number of rows and columns in our composite, respectively. The byrow argument, if true, will add plots by row, if false, it will add by column.


{% highlight r %}
par(mar = c(4, 4, 2, 1))
layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE))
plot(iris$Sepal.Length, ylab = "Sepal Length (cm)")
plot(iris$Sepal.Width, ylab = "Sepal Width (cm)")
plot(iris$Petal.Length, ylab = "Petal Length (cm)")
{% endhighlight %}

![plot of chunk unnamed-chunk-20](https://raw.githubusercontent.com/UniExeterRSE/intro-to-r/main/figure/rmarkdown/08_plots/unnamed-chunk-20-1.png)

# Saving and Exporting Plots

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

Activity: 

1. Make two objects, one object containing values 1-20, and another object containing values 40-21
    a. Using your objects, create a plot with the object containing 1:20 on the x-axis and the object containing 40-21 on y-axis
    b. Change the x-axis label to "Independent Variable" and y-axis label to "Dependent Variable"
    c. Expand both axes to show values 1-40
    d. Increase the data point size, change their style and make them repeat between five colours
    e. Add a legend top the top right of the plot showing the five colours you have chosen and labelling them A, B, C, D, and E
    f. Add a horizontal line at 30, choose a colour, weight and style
    g. Add a vertical line at 10, choose a different colour, weight and style
    h. Add text saying "Cross Point" to the top right of the intersection of the two lines. Adjust the colour and size


2. Using "iris", create a scatter plot with "Sepal.Length" on x-axis, labelled "Sepal length (cm)", and the other three variables plotted on y-axis, with the label being "Size (cm)"
    a. Colour the three species differently and make the three measures different style of points 
    b. Add a legend to show all the groups, and make sure it doesn't cover any points
    c. Make sure the x-axis limits are 0-8 and y-axis limit is 4-8
    d. Adjust the margins to give a larger space around the edge of the plot and move the axis labels a little away from the axes
    e. Export the image as a pdf


3. Create a composite plot with the following panels using "iris". Make the plots colourful and variable, that all points are visible in plotting window, axes have labels and measurement units. Export the plot as a high resolution (200) jpeg. Make sure the points and text are readable, and all info is visible. You may need to adjust margins
    a. Box plot of "Petal.Length" by species coloured by species
    b. Histogram of "Petal.Length" with 6 breaks, each one coloured differently, with a line added for the mean (hint: mean), coloured and labelled "Mean = X" where "X" is the mean value. Make this panel take more space
    c. "Petal.Length" against "Petal.Width" for just "virginica" species, with a line of best fit (hint: subsetting)
