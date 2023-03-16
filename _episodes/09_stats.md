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

To do statistics we need some observed data. We will use a dataset contained in the csv file [bp_dataset.csv](../data/bp_dataset_session4.csv). This dataset is based on a clinical trial to test the effect of two 
drugs (Drug A and Drug B), compared with an inactive control drug (placebo), on blood pressure in people who have high blood pressure. The purpose of the 
drugs is to reduce blood pressure. Some additional information about the people in the trial, such as their age and sex, is also provided (see 
[codebook](../data/bp_dataset_codebook_session4.xlsx) for further information about the variables).

Let's start by loading the dataset. You need to ensure that the dataset is located in your current working directory. 
We will read in the csv file and assign it to a variable called ```bp_dataset```. The ```header=TRUE``` argument means R will take the entries in the first row 
 and use these to set the column headings. 


{% highlight r %}
bp_dataset<-read.csv(file="bp_dataset_session4.csv", header=TRUE)
{% endhighlight %}

Take a look at the column heads.


{% highlight r %}
head(bp_dataset)
{% endhighlight %}



{% highlight text %}
##   ptid male age intervention bp_baseline bp_3m bp_6m
## 1    1    1  41       Drug B         218   153   163
## 2    2    0  46       Drug B         200   162   177
## 3    3    0  37       Drug A         198   122   166
## 4    4    0  46       Drug A         202   148   128
## 5    5    1  44      Control         142   196   231
## 6    6    1  36       Drug B         148   191   164
{% endhighlight %}

Let's find out how many rows (observations) and variables (columns) are in this dataset using the 'dim' command (for dimensions).


{% highlight r %}
dim(bp_dataset)
{% endhighlight %}



{% highlight text %}
## [1] 100   7
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
## 'data.frame':	100 obs. of  7 variables:
##  $ ptid        : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ male        : int  1 0 0 0 1 1 0 0 1 1 ...
##  $ age         : int  41 46 37 46 44 36 65 69 58 65 ...
##  $ intervention: chr  "Drug B" "Drug B" "Drug A" "Drug A" ...
##  $ bp_baseline : int  218 200 198 202 142 148 166 201 206 140 ...
##  $ bp_3m       : int  153 162 122 148 196 191 140 141 173 125 ...
##  $ bp_6m       : int  163 177 166 128 231 164 152 113 164 115 ...
{% endhighlight %}

In this dataset we have both integer and character variables. Gender is provided as a binary, indicator or dummary variable called ```male``` coded as 0 
(for female) and 1 (for male). This is not nessecary, if it was coded as a factor with the levels "Female" and "Male" R would be happy to use in the 
statistical functions. Coding it in this way however, is more aligned with how it is used in statistics, and may make interpetation easier. 

The variable `intervention` is a character variable, but could be an integer coded, for example, as Control=0, Drug A=1, 
 Drug B=2.


# Summary statistics

In this dataset, there are 4 numeric variables. These are ```age```, and blood pressure measured at three timepoints (```bp_baseline```, 
```bp_3m```, ```bp_6m```).

We want to find the mean, median, standard deviation and variance for these variables. Let's start with the mean. To find the mean for ```age``` we can use:


{% highlight r %}
mean(bp_dataset$age)
{% endhighlight %}



{% highlight text %}
## [1] 49.03
{% endhighlight %}

We can attach the dataframe ```bp_dataset```, so we don't need to use the ```$``` notation for each command. Remember to use the ```detach()``` 
command when you wish to detach the dataframe.


{% highlight r %}
attach(bp_dataset)
mean(age)
{% endhighlight %}



{% highlight text %}
## [1] 49.03
{% endhighlight %}

We can also calculate the median, standard deviation, variance, minimum, maximum, range and sum fairly easily using base R functions. 



{% highlight r %}
sd(age)
{% endhighlight %}



{% highlight text %}
## [1] 12.31116
{% endhighlight %}



{% highlight r %}
median(age)
{% endhighlight %}



{% highlight text %}
## [1] 47
{% endhighlight %}



{% highlight r %}
var(age)
{% endhighlight %}



{% highlight text %}
## [1] 151.5647
{% endhighlight %}



{% highlight r %}
min(age)
{% endhighlight %}



{% highlight text %}
## [1] 26
{% endhighlight %}



{% highlight r %}
max(age)
{% endhighlight %}



{% highlight text %}
## [1] 81
{% endhighlight %}



{% highlight r %}
range(age)
{% endhighlight %}



{% highlight text %}
## [1] 26 81
{% endhighlight %}



{% highlight r %}
sum(age)
{% endhighlight %}



{% highlight text %}
## [1] 4903
{% endhighlight %}

*Note* The commands 'sd' and 'var' calculate the sample sd and variance, not the population sd and variance.

We can also caluclate multiple a descriptive summary statistics of a numeric varible using the function ```summary()```


{% highlight r %}
summary(age)
{% endhighlight %}



{% highlight text %}
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   26.00   40.00   47.00   49.03   56.25   81.00
{% endhighlight %}

## Activity

Find the means, medians and range for `bp_baseline` and `bp_3m`.

# Summary statistics by groups

We can calculate statistics for different subsets or groups of the data by using R command ```tapply()```. The ```tapply()``` 
command requires 3  arguments :

 + a numeric variable which we want to summarise (in the example below this is ```age```) 
 + a categorical variable indicating the subgroups,which we want to group by (in the example below this is ```male```)
 + the function we wish to call on each subgroup (in the example below this is ```mean```)


{% highlight r %}
tapply(age, male, mean)
{% endhighlight %}



{% highlight text %}
##        0        1 
## 51.94595 47.31746
{% endhighlight %}

We can also calculate the mean for a sub group, by subsetting it. For example to calucate the mean of just the means (i.e where male==1). 
Note the use of ```==``` for specifiying an equality condition.



{% highlight r %}
mean(age[male==1])
{% endhighlight %}



{% highlight text %}
## [1] 47.31746
{% endhighlight %}


We can use the ```tapply()``` function to calculate the medians for the intervention groups.


{% highlight r %}
tapply(age, intervention, median)
{% endhighlight %}



{% highlight text %}
## Control  Drug A  Drug B 
##    49.5    49.5    42.5
{% endhighlight %}

We can also do more complicated subgroups, for example cross 
Let's say we want to calculate the mean age by sex and intervention group. We can use the 'aggregate' command. The FUN argument means function, which is the mean in this example.



{% highlight r %}
aggregate(age ~ male + intervention, data=bp_dataset, FUN=mean)
{% endhighlight %}



{% highlight text %}
##   male intervention      age
## 1    0      Control 53.84615
## 2    1      Control 49.33333
## 3    0       Drug A 56.63636
## 4    1       Drug A 47.73913
## 5    0       Drug B 46.07692
## 6    1       Drug B 45.72000
{% endhighlight %}

<br>


<br>

We can also calculate percentiles. Using the 'quantile' command we can set the quantiles that we wish to find. Note that the 0.5 quantile is the median.


{% highlight r %}
quantile(age, probs = c(.25, .5, .75))
{% endhighlight %}



{% highlight text %}
##   25%   50%   75% 
## 40.00 47.00 56.25
{% endhighlight %}

To get the inter-quartile range (75th percentile minus 25th percentile):


{% highlight r %}
IQR(age)
{% endhighlight %}



{% highlight text %}
## [1] 16.25
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
## male
##  0  1 
## 37 63
{% endhighlight %}

If we also wish to calculate proportions or percentages, we can use the 'prop.table' command. We first need to create the table and then pass to 'prop.table'.


{% highlight r %}
table.male<-table(male)
prop.table(table.male)
{% endhighlight %}



{% highlight text %}
## male
##    0    1 
## 0.37 0.63
{% endhighlight %}

We can also create a table for a subgroup of the data. For example: table by sex for people aged over 50.


{% highlight r %}
table(male[age>50])
{% endhighlight %}



{% highlight text %}
## 
##  0  1 
## 17 19
{% endhighlight %}

We can also produce a table of proportions.


{% highlight r %}
table.male.over50<-table(male[age>49])
prop.table(table.male.over50)
{% endhighlight %}



{% highlight text %}
## 
##    0    1 
## 0.45 0.55
{% endhighlight %}

We can also produce cross-tabulations for two categorical variables.


{% highlight r %}
table(male, intervention)
{% endhighlight %}



{% highlight text %}
##     intervention
## male Control Drug A Drug B
##    0      13     11     13
##    1      15     23     25
{% endhighlight %}



{% highlight r %}
table.male.intervention<-table(male, intervention)
prop.table(table.male.intervention)
{% endhighlight %}



{% highlight text %}
##     intervention
## male Control Drug A Drug B
##    0    0.13   0.11   0.13
##    1    0.15   0.23   0.25
{% endhighlight %}

<br>


#### Task 3
Create table of frequencies and a table of percentages by intervention group.

<br>

#### Task 4 
Create table of frequencies and a table of percentages by intervention group for people whose baseline blood pressure is greater than or equal to 180.

***

