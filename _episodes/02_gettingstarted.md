---
layout: page
title: Getting Up and Running with R
order: 2
session: 1
length: 180
toc: true
---


In this session you will receive a guided tour of RStudio. From installing the required software to running the basic commands in a script. We will help you installating R and RStudio and equip you with the basic notions of RStudio to ease your progress. These notions include an understaning of the RStudio layout, how to create a script, and run basic commands. There are some exercises for you to check your understanding and in case you want more, there is a script in section 10 with more commands and other examples.


# What are R and RStudio?

**R** and **RStudio** are both free software programs used for statistical analysis. R is the program performing the commands and RStudio provides an interface so that users have an improved experience using the program. 


The RStudio interface is designed so that you can see the plots, tables and code at the same time. You will learn about the layout of RStudio in this course. For now, you just need to know that R and RStudio work together and that RStudio is a friendlier version for the user.

R and RStudio have many advantages, for instance:

  - They are free and open source. This means that there is a huge community readily available to help you solve questions or issues with your code. It also means that there's people developing new hacks to make possible more advanced operations.
  - They are available for Windows, Macintosh, and Linux.
  - RStudio is not only used for analysis, you can also create documents and slides, and you can embed your analysis into these documents. It's like having Word, Excel and Powerpoint in one place.


# Installation

Because R and RStudio work together, you need to install them both. The steps in this section should guide you through the process. Once installed, you will be working with RStudio and R will be running in the back. 

*Note* that when people say R, most of the time, they are referring to RStudio.


## How to Install R?

Installing R in 4 easy steps

<br>

**Step 1.** 

a. Go to: https://www.r-project.org/

b. Click on **CRAN** or **download R**.

<br>

*Note:* You'll only do this once, although, eventually you'll have to update to the most recent version. Follow the same procedure as today.


<br>

**Step 2.** Select a mirror

A *Mirror* is a server somewhere in the world with a copy of the program. Choose the mirror closest to you. For example, if you are in the UK, you can select the one from University of Bristol. Don't worry too much about this.

<br>

**Step 3.** Select the download appropriate for your computer (Microsoft, Mac or Linux)

<br>

**Step 4.** Open the program you downloaded and follow the instructions

*Note* - There is another tutorial identical to this one that shows the process you need to follow if you have a mac.

<br><br>

![Alt Text](../images/gif_windows.gif)


## How to Install RStudio?

Yes, you need to install both R and RStudio. Follow this 3 easy steps:

<br>

**Step 1.** 
a. Go to: https://www.rstudio.com/products/rstudio/download/

b. Click on the free version **Download** button

<br>

**Step 2.** Select your download accordingly. 

<br>

**Step 3.** Click on the download and follow the installation instructions


<br>

![Alt Text](../images/rstudio_windows.gif)

<br>

***

# What does R look like?

Now, let's open RStudio and see what it looks like. 


![Alt Text](../images/r_logo.png)

When you open RStudio, you will see a screen like this one:

![Alt Text](../images/rstudio_screen.png)

<br>

Click on the icon to get the screen with four sections and I'll run you through all of them.

![Alt Text](../images/rstudio_screen_1.png)

<br>

Now, you should see something like this:

![Alt Text](../images/rstudio_screen_2.png)

<br>

You can change the settings in your computer to reorder the different sections, or to change the appearance of your screen.

<br>

# Let's get you acquainted
You should see 4 panes on your screen. We'll talk about each one.

![Alt Text](../images/rstudio_screen_3.png)

<br>

**Pane 1:** This pane holds your script, set of commands, or code. The script is your working document.

- Add a title, your name, and a date. Use the hash tag (#) symbol to tell R that this is a reading text and not a command.
- Save it to your computer as you would do with a word or excel file.

![Alt Text](../images/rstudio_screen_4.png)

<br>

Let's play with the basic features of RStudio and populate our first script.

<br>

**Creating an outline**
1. Create a title that reads "Part 1". Use one hash tag symbol at the beginning and end with 4 dashes (- - - -).

2. Create a subtitle that reads "1.1 Writing a simple command" Now, use two hash tags at the beginning and, as before, end with 4 dashes (- - - -).

3. Look at the outline. This feature is very useful to navigate your script when it starts growing.

![Alt Text](../images/rstudio_screen_outline.png)

<br>

Let's move on.

<br>

