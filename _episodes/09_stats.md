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

Let's find out how many rows (observations) and variables (columns) are in this dataset using the ```dim``` command (for dimensions).


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
remit of this course - but you can find out more about the principles of [tidy data here](https://r4ds.had.co.nz/tidy-data.html).

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

The variable `intervention` is a character variable.


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

We can also calculate percentiles. Using the ```quantile()``` command we need to specify which quantiles ( as proportions) that we want to calculate,
where the 0.5 quantile would represent the median.


{% highlight r %}
quantile(age, probs = c(.25, .5, .75))
{% endhighlight %}



{% highlight text %}
##   25%   50%   75% 
## 40.00 47.00 56.25
{% endhighlight %}

To get the inter-quartile range (75th percentile minus 25th percentile) we can do this with the ```IQR()``` function.


{% highlight r %}
IQR(age)
{% endhighlight %}



{% highlight text %}
## [1] 16.25
{% endhighlight %}

We can also calculate multiple descriptive summary statistics of a numeric variable simultaneously using the function ```summary()```.


{% highlight r %}
summary(age)
{% endhighlight %}



{% highlight text %}
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   26.00   40.00   47.00   49.03   56.25   81.00
{% endhighlight %}

## Activity

Find the means, medians and range for the variable ```bp_baseline``` and ```bp_3m```.

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

If we want to calculate a summary statistics for a sub group, by subsetting it and providing the subset to the ```mean()``` function. For example 
to calucate the mean of just the means (i.e where male==1). 
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

If we want to calculate summary statistics for combinations of groups for example by sex and intervention group, we can use the ```aggregate()```
 command. We use the formula method to specify which variables we want summarise (on the left hand side of the ~) and which we want to group by
 (on the right hand side of the ~).  If all the variables are included in
 single data.frame, we can construct the formula using just the column names, and include the argument ```data``` to specify which object these are found
 in. The ```FUN``` argument specfies which function you want to apply to these data, which is the mean in this example. 
 Note that we need to include the dataset as an argument, even though we have attached ```bp_dataset```.



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


{% highlight r %}
aggregate(age, bp_baseline ~ male + intervention, data=bp_dataset, FUN=mean)
{% endhighlight %}



{% highlight text %}
## Error in aggregate.formula(x = by, data = x, FUN = FUN, ...): formal argument "data" matched by multiple actual arguments
{% endhighlight %}

## Activity

Calculate the mean, SD, median, 10th and 90th percentiles for `bp_baseline` for each intervention group. 
Also calculate the 25th centile, 50th centile (median) and 75th centile for `age`, for each combination of sex and intervention group. 


# Summary statistics for categorical data

We can create a frequency table for categorical variables using the ```table()``` command.


{% highlight r %}
table(male)
{% endhighlight %}



{% highlight text %}
## male
##  0  1 
## 37 63
{% endhighlight %}

We can also produce cross-tabulations for two categorical variables. In fact we can produce tables for more than 2 categorical variables. 


{% highlight r %}
table(male, intervention)
{% endhighlight %}



{% highlight text %}
##     intervention
## male Control Drug A Drug B
##    0      13     11     13
##    1      15     23     25
{% endhighlight %}


If we also wish to calculate proportions or percentages, we can use the ```prop.table()``` command. We first need to create the 
table and then pass to ```prop.table()```. Youcan either do this in two stages:


{% highlight r %}
table.male<-table(male)
prop.table(table.male)
{% endhighlight %}



{% highlight text %}
## male
##    0    1 
## 0.37 0.63
{% endhighlight %}

Or as a nested function call:


{% highlight r %}
prop.table(table(male, intervention))
{% endhighlight %}



{% highlight text %}
##     intervention
## male Control Drug A Drug B
##    0    0.13   0.11   0.13
##    1    0.15   0.23   0.25
{% endhighlight %}

We can also create a table for a subgroup of the data by providing just a subset of the data to the ```table()``` function.
 For example to count the number of each sex, only for people aged over 50:


{% highlight r %}
table(male[age>50])
{% endhighlight %}



{% highlight text %}
## 
##  0  1 
## 17 19
{% endhighlight %}


## Activity 
Create table of frequencies and a table of percentages for each intervention group.

Create table of frequencies and a table of percentages for intervention group stratified by whether their baseline blood pressure is 
greater than or equal to 180.

# Common statistical tests : One-sample t-test

There are several types of t-test. We will start with the simplest: a one-sample 2-sided t-test to test the null hypothesis that the true mean 
value of a continuous variable is equal to a pre-specified value. The default behaviour, and the most common application is to compare to a value of 0.


{% highlight r %}
t.test(age)
{% endhighlight %}



{% highlight text %}
## 
## 	One Sample t-test
## 
## data:  age
## t = 39.826, df = 99, p-value < 2.2e-16
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  46.5872 51.4728
## sample estimates:
## mean of x 
##     49.03
{% endhighlight %}



Here we can see our results is highly significant, as given we are a population of adults, they are all a lot older than 0 so it is not surprising.


We can vary the width of the confidence interval provided as part of the t-test output - the default is 95% CI.


{% highlight r %}
t.test(age, mu=50, conf.level=0.90)
{% endhighlight %}



{% highlight text %}
## 
## 	One Sample t-test
## 
## data:  age
## t = -0.7879, df = 99, p-value = 0.4326
## alternative hypothesis: true mean is not equal to 50
## 90 percent confidence interval:
##  46.98587 51.07413
## sample estimates:
## mean of x 
##     49.03
{% endhighlight %}

We can also specify the dataset and a subset of the data if needed. For example, in females only:


{% highlight r %}
female_only<-subset(bp_dataset, male==0)
head(female_only)
{% endhighlight %}



{% highlight text %}
##    ptid male age intervention bp_baseline bp_3m bp_6m
## 2     2    0  46       Drug B         200   162   177
## 3     3    0  37       Drug A         198   122   166
## 4     4    0  46       Drug A         202   148   128
## 7     7    0  65      Control         166   140   152
## 8     8    0  69       Drug A         201   141   113
## 11   11    0  53       Drug A         186   107   122
{% endhighlight %}



{% highlight r %}
detach(bp_dataset)
{% endhighlight %}


{% highlight r %}
attach(female_only)
t.test(age, mu=50)
{% endhighlight %}



{% highlight text %}
## 
## 	One Sample t-test
## 
## data:  age
## t = 0.8605, df = 36, p-value = 0.3952
## alternative hypothesis: true mean is not equal to 50
## 95 percent confidence interval:
##  47.35957 56.53232
## sample estimates:
## mean of x 
##  51.94595
{% endhighlight %}



{% highlight r %}
detach(female_only)
attach(bp_dataset)
{% endhighlight %}

We can also specify a 1-sided t-test looking for whether the true mean of the variable is greater than or less than the specified value. To test whether true mean `age` is less than 50:


{% highlight r %}
t.test(age, mu=50, alternative="less")
{% endhighlight %}



{% highlight text %}
## 
## 	One Sample t-test
## 
## data:  age
## t = -0.7879, df = 99, p-value = 0.2163
## alternative hypothesis: true mean is less than 50
## 95 percent confidence interval:
##      -Inf 51.07413
## sample estimates:
## mean of x 
##     49.03
{% endhighlight %}

To test whether true mean `age` is greater than 45:


{% highlight r %}
t.test(age, mu=45, alternative="greater")
{% endhighlight %}



{% highlight text %}
## 
## 	One Sample t-test
## 
## data:  age
## t = 3.2735, df = 99, p-value = 0.000732
## alternative hypothesis: true mean is greater than 45
## 95 percent confidence interval:
##  46.98587      Inf
## sample estimates:
## mean of x 
##     49.03
{% endhighlight %}


Although this is a very uncommon application (due to the need to justify the choice of value), you can perform a t-test against a value 
other than 0 by including the argument ```mu```. For example, we can use a t-test to test if true mean ```age```=50.


{% highlight r %}
t.test(age, mu=50)
{% endhighlight %}



{% highlight text %}
## 
## 	One Sample t-test
## 
## data:  age
## t = -0.7879, df = 99, p-value = 0.4326
## alternative hypothesis: true mean is not equal to 50
## 95 percent confidence interval:
##  46.5872 51.4728
## sample estimates:
## mean of x 
##     49.03
{% endhighlight %}



### Two-sample unpaired t-test

The two-sample unpaired t-test is used to compare the mean values of a continuous variable for two independent groups (the groups are not matched or paired in any way).

In this example, we wish compare the mean value of age between males and females, or in other words we wish to know whether the true mean `age` is equal for males and females.

`age` is the response variable (also called outcome variable or dependent variable); we are comparing mean `age` in Group 1 (male) with mean `age` in Group 0 (female), i.e. mean difference= Group 1 mean - Group 0 mean.

*Note* This version of the t-test assumes unequal variance.


{% highlight r %}
t.test(age~male)
{% endhighlight %}



{% highlight text %}
## 
## 	Welch Two Sample t-test
## 
## data:  age by male
## t = 1.739, df = 63.594, p-value = 0.08687
## alternative hypothesis: true difference in means between group 0 and group 1 is not equal to 0
## 95 percent confidence interval:
##  -0.6891826  9.9461538
## sample estimates:
## mean in group 0 mean in group 1 
##        51.94595        47.31746
{% endhighlight %}

We can also use a factor variable to indicate the two groups (i.e. as opposed to an integer variable with groups coded as numbers).


{% highlight r %}
t.test(age~male_factor)
{% endhighlight %}



{% highlight text %}
## Error in eval(predvars, data, env): object 'male_factor' not found
{% endhighlight %}

We can test for equal variance by using a statistical test called an F test. The null hypothesis for this test is that variances are equal. To compare the variance of `age` by `male`:


{% highlight r %}
var.test(age ~ male)
{% endhighlight %}



{% highlight text %}
## 
## 	F test to compare two variances
## 
## data:  age by male
## F = 1.5248, num df = 36, denom df = 62, p-value = 0.1431
## alternative hypothesis: true ratio of variances is not equal to 1
## 95 percent confidence interval:
##  0.8663612 2.8110952
## sample estimates:
## ratio of variances 
##           1.524841
{% endhighlight %}

An alternative statistical test to test for equal variances is Bartlett's test (again, the null hypothesis assumes that variances are equal for each group):


{% highlight r %}
bartlett.test(age ~ male)
{% endhighlight %}



{% highlight text %}
## 
## 	Bartlett test of homogeneity of variances
## 
## data:  age by male
## Bartlett's K-squared = 2.0664, df = 1, p-value = 0.1506
{% endhighlight %}

If we wish to repeat the t-test using the assumption of equal variance:


{% highlight r %}
t.test(age~male, var.equal=TRUE)
{% endhighlight %}



{% highlight text %}
## 
## 	Two Sample t-test
## 
## data:  age by male
## t = 1.8368, df = 98, p-value = 0.06927
## alternative hypothesis: true difference in means between group 0 and group 1 is not equal to 0
## 95 percent confidence interval:
##  -0.3721683  9.6291395
## sample estimates:
## mean in group 0 mean in group 1 
##        51.94595        47.31746
{% endhighlight %}

### Paired t-test: comparing pairs of matched values

A paired t-test is used to compare two variables that are matched or paired in some way, for examples, measurements made on the same person at two different times. The paired t-test uses the differences between matched pairs of measurements to test whether the true means are equal.

For example, we may wish to perform a paired- t-test to test whether the true mean values for BP at baseline (`bp_baseline`) and BP at 3 months (`bp_3m`) are the same, taking into account that each person has their blood pressure measured at both baseline and 3 months, i.e. each measurement at baseline has a 'matched' measurement at 3 months taken in the same person.



{% highlight r %}
t.test(bp_3m,bp_baseline,paired=TRUE)
{% endhighlight %}



{% highlight text %}
## 
## 	Paired t-test
## 
## data:  bp_3m and bp_baseline
## t = -4.5608, df = 99, p-value = 1.462e-05
## alternative hypothesis: true mean difference is not equal to 0
## 95 percent confidence interval:
##  -23.707166  -9.332834
## sample estimates:
## mean difference 
##          -16.52
{% endhighlight %}

Note that the results are different if we do not
take into account the paired nature of the variables.


{% highlight r %}
t.test(bp_3m,bp_baseline,paired=FALSE)
{% endhighlight %}



{% highlight text %}
## 
## 	Welch Two Sample t-test
## 
## data:  bp_3m and bp_baseline
## t = -4.8468, df = 197.48, p-value = 2.534e-06
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -23.241544  -9.798456
## sample estimates:
## mean of x mean of y 
##    165.88    182.40
{% endhighlight %}

<br>

#### Task 14
Perform a single sample 2-sided t-test to test whether the true mean of baseline BP is equal to 170. 
<br>

Repeat for test of whether true mean of baseline BP is equal to 180.<br>

Repeat for a 1-sided t-test of whether true mean of baseline BP is greater than 185.

<br>


#### Task 15
Perform an unpaired t-test to compare mean BP at 3 months between Drug A and the control group. Hint: use the ! symbol to indicate a logical statement about intervention.

<br>

Do the same to compare mean BP at 3 months between Drug B vs control, and between Drug B vs Drug A.

<br>


#### Task 16
Perform a paired t-test to test the null hypothesis that mean difference is 0 comparing BP at 6 months with BP at baseline.
<br>

Repeat to compare BP at 6 months with BP at 3 months for women (male=0) only.

***

