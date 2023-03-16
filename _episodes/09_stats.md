---
layout: page
title: Statistical Analysis 
order: 9
session: 3
length: 60
toc: true
adapted: false
attrib_name: Programming with R
attrib_link: https://github.com/swcarpentry/r-novice-inflammation
attrib_copywrite: Software Carpentry
attrib_license: CC-BY 4.0
attrib_license_link: https://creativecommons.org/licenses/by/4.0/
---

R is synmomous with data analysis. Here we will learn how to perform a number of common statistical tests with R.

# Loading the dataset

To do statistics we need some observed data. We will use a dataset contained in the csv file [bp_dataset.csv]("../data/bp_dataset_session4.csv"). This dataset is based on a clinical trial to test the effect of two 
drugs (Drug A and Drug B), compared with an inactive control drug (placebo), on blood pressure in people who have high blood pressure. The purpose of the 
drugs is to reduce blood pressure. Some additional information about the people in the trial, such as their age and sex, is also provided (see 
[codebook]("../data/bp_dataset_codebook_session4.xlsx") for further information about the variables).

Let's start by loading the dataset. You need to ensure that the dataset is located in your current working directory. 
We will read in the csv file and assign it to a variable called ```bp_dataset```. The ```header=TRUE``` argument means R will take the entries in the first row 
 and use these to set the column headings. 


{% highlight r %}
bp_dataset<-read.csv(file="bp_dataset_session4.csv", header=TRUE)
{% endhighlight %}



{% highlight text %}
## Warning in file(file, "rt"): cannot open file 'bp_dataset_session4.csv': No
## such file or directory
{% endhighlight %}



{% highlight text %}
## Error in file(file, "rt"): cannot open the connection
{% endhighlight %}

Take a look at the column heads.


{% highlight r %}
head(bp_dataset)
{% endhighlight %}



{% highlight text %}
## Error in head(bp_dataset): object 'bp_dataset' not found
{% endhighlight %}

Let's find out how many rows (observations) and variables (columns) are in this dataset using the 'dim' command (for dimensions).


{% highlight r %}
dim(bp_dataset)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'bp_dataset' not found
{% endhighlight %}


<details>
	<summary> Data Organisation </summary>
	<pre>
		
When it comes to programming how you organise/store your data becomes important to facilitate efficient processing. This is beyond the
remit of this course - but you can find out more about the principles of ["tidy" data](https://r4ds.had.co.nz/tidy-data.html).

    </pre>
</details>



We also want to check the types of variable in the dataframe. The 'str' command allows us to check the structure of the dataframe and tells us 
about the types of variables in our dataset.


{% highlight r %}
str(bp_dataset)
{% endhighlight %}



{% highlight text %}
## Error in str(bp_dataset): object 'bp_dataset' not found
{% endhighlight %}

In this dataset we have both integer and character variables. Gender is provided as a binary, indicator or dummary variable called ```male``` coded as 0 
(for female) and 1 (for male). This is not nessecary, if it was coded as a factor with the levels "Female" and "Male" R would be happy to use in the 
statistical functions. Coding it in this way however, is more aligned with how it is used in statistics, and may make interpetation easier. 

The variable `intervention` is a character variable, but could be an integer coded, for example, as Control=0, Drug A=1, 
 Drug B=2.


# Summary statistics

In this dataset, there are 4 numeric variables. These are ```age```, and blood pressure measured at three timepoints (```bp_baseline```, ```bp_3m```, ```bp_6m```).

We want to find the mean, median, standard deviation and variance for these variables. Let's start with the mean. To find the mean for `age` we can use:


{% highlight r %}
mean(bp_dataset$age)
{% endhighlight %}



{% highlight text %}
## Error in mean(bp_dataset$age): object 'bp_dataset' not found
{% endhighlight %}

We can attach the dataframe `bp_dataset`, so we don't need to use the $ notation for each command. Remember to use the 'detach' command when you wish to detach the dataframe.


{% highlight r %}
attach(bp_dataset)
{% endhighlight %}



{% highlight text %}
## Error in attach(bp_dataset): object 'bp_dataset' not found
{% endhighlight %}



{% highlight r %}
mean(age)
{% endhighlight %}



{% highlight text %}
## Error in mean(age): object 'age' not found
{% endhighlight %}
<br>

#### Task 1
Find the means for `bp_baseline` and `bp_3m`.

<br>

We can summarise for different subsets of the data by using R command 'tapply'. The 'tapply' command takes 3 arguments in the below command:

 + `age`: numeric variable for which we wish to calculate the mean
 + `male`: variable indicating the subgroups, in this case 0 and 1
 + mean: the statistic we wish to calculate


{% highlight r %}
tapply(age, male, mean)
{% endhighlight %}



{% highlight text %}
## Error in tapply(age, male, mean): object 'male' not found
{% endhighlight %}

We can also use the code below. This calculates the mean for males [male==1]. Remember to use == to set the value of the variable `male` to be equal to 1.



{% highlight r %}
mean(age[male==1])
{% endhighlight %}



{% highlight text %}
## Error in mean(age[male == 1]): object 'age' not found
{% endhighlight %}

<br>

We can do the same for intervention group.


{% highlight r %}
tapply(age, intervention, mean)
{% endhighlight %}



{% highlight text %}
## Error in tapply(age, intervention, mean): object 'intervention' not found
{% endhighlight %}

Let's say we want to calculate the mean age by sex and intervention group. We can use the 'aggregate' command. The FUN argument means function, which is the mean in this example.



{% highlight r %}
aggregate(age ~ male + intervention, data=bp_dataset, FUN=mean)
{% endhighlight %}



{% highlight text %}
## Error in eval(m$data, parent.frame()): object 'bp_dataset' not found
{% endhighlight %}

<br>
We can also calculate the median, standard deviation, variance, minimum, maximum, range and sum. <br>
*Note* The commands 'sd' and 'var' calculate the sample sd and variance, not the population sd and variance.


{% highlight r %}
sd(age)
{% endhighlight %}



{% highlight text %}
## Error in is.data.frame(x): object 'age' not found
{% endhighlight %}



{% highlight r %}
median(age)
{% endhighlight %}



{% highlight text %}
## Error in median(age): object 'age' not found
{% endhighlight %}



{% highlight r %}
var(age)
{% endhighlight %}



{% highlight text %}
## Error in is.data.frame(x): object 'age' not found
{% endhighlight %}



{% highlight r %}
min(age)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'age' not found
{% endhighlight %}



{% highlight r %}
max(age)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'age' not found
{% endhighlight %}



{% highlight r %}
range(age)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'age' not found
{% endhighlight %}



{% highlight r %}
sum(age)
{% endhighlight %}



{% highlight text %}
## Error in eval(expr, envir, enclos): object 'age' not found
{% endhighlight %}

<br>

We can also calculate percentiles. Using the 'quantile' command we can set the quantiles that we wish to find. Note that the 0.5 quantile is the median.


{% highlight r %}
quantile(age, probs = c(.25, .5, .75))
{% endhighlight %}



{% highlight text %}
## Error in quantile(age, probs = c(0.25, 0.5, 0.75)): object 'age' not found
{% endhighlight %}

To get the inter-quartile range (75th percentile minus 25th percentile):


{% highlight r %}
IQR(age)
{% endhighlight %}



{% highlight text %}
## Error in quantile(as.numeric(x), c(0.25, 0.75), na.rm = na.rm, names = FALSE, : object 'age' not found
{% endhighlight %}

<br>

#### Task 2

Calculate the mean, SD, median, 10th and 90th percentiles for `bp_baseline` for each intervention group. Also calculate the 25th centile, 50th centile (median) and 75th centile for `age`, by each combination of sex and intervention group. The aggregate command will be needed for this task: note that we need to include the dataset as a function, even though we have attached `bp_dataset`.

<br>

We can create a frequency table for categorical variables using the 'table' command.


{% highlight r %}
table(male)
{% endhighlight %}



{% highlight text %}
## Error in table(male): object 'male' not found
{% endhighlight %}

If we also wish to calculate proportions or percentages, we can use the 'prop.table' command. We first need to create the table and then pass to 'prop.table'.


{% highlight r %}
table.male<-table(male)
{% endhighlight %}



{% highlight text %}
## Error in table(male): object 'male' not found
{% endhighlight %}



{% highlight r %}
prop.table(table.male)
{% endhighlight %}



{% highlight text %}
## Error in prop.table(table.male): object 'table.male' not found
{% endhighlight %}

We can also create a table for a subgroup of the data. For example: table by sex for people aged over 50.


{% highlight r %}
table(male[age>50])
{% endhighlight %}



{% highlight text %}
## Error in table(male[age > 50]): object 'male' not found
{% endhighlight %}

We can also produce a table of proportions.


{% highlight r %}
table.male.over50<-table(male[age>49])
{% endhighlight %}



{% highlight text %}
## Error in table(male[age > 49]): object 'male' not found
{% endhighlight %}



{% highlight r %}
prop.table(table.male.over50)
{% endhighlight %}



{% highlight text %}
## Error in prop.table(table.male.over50): object 'table.male.over50' not found
{% endhighlight %}

We can also produce cross-tabulations for two categorical variables.


{% highlight r %}
table(male, intervention)
{% endhighlight %}



{% highlight text %}
## Error in table(male, intervention): object 'male' not found
{% endhighlight %}



{% highlight r %}
table.male.intervention<-table(male, intervention)
{% endhighlight %}



{% highlight text %}
## Error in table(male, intervention): object 'male' not found
{% endhighlight %}



{% highlight r %}
prop.table(table.male.intervention)
{% endhighlight %}



{% highlight text %}
## Error in prop.table(table.male.intervention): object 'table.male.intervention' not found
{% endhighlight %}

<br>


#### Task 3
Create table of frequencies and a table of percentages by intervention group.

<br>

#### Task 4 
Create table of frequencies and a table of percentages by intervention group for people whose baseline blood pressure is greater than or equal to 180.

***

