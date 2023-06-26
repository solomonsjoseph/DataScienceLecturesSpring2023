---
title: "Efficient Management of Data in R (Data Structures!)"
subtitle: "Data Science Lecture Series: Advanced R"
author: | 
  | W. Evan Johnson, Ph.D.
  | Professor, Division of Infectious Disease
  | Director, Center for Data Science
  | Rutgers University -- New Jersey Medical School
date: "2023-03-27"
header-includes:
   - \usepackage{amsmath}
output: 
  beamer_presentation:
    theme: "CambridgeUS"
editor_options: 
  chunk_output_type: console
tables: true
---

# Importing data

## Importing data
The first problem a data scientist will usually face is how to import data into R! \vskip .2in

Often they have to import data from either a file, a database, or other sources. One of the most common ways of storing and sharing data for analysis is through electronic spreadsheets. \vskip .2in

A spreadsheet stores data in rows and columns. It is basically a file version of a * `data frame` (or a `tibble!`).

## Importing data
A common function for importing data is the `read.table` function: 


```r
mydata <- read.table("mydata.txt")
```

This is looking for a structured dataset, with the same number of entries in each row, and data that is delimited with a single space between values.  

## Importing data
The `read.table` function can also read tab-delimited data: 



```r
mydata <- read.table("mydata.txt", sep="\t")
```

\vskip .2in
Or comma separated (.csv) formats: 

```r
mydata <- read.table("mydata.txt", sep=",")
```

(also explore the {\bf read.csv} function)

## Importing data
We can also add options to set the first column as a header and select a row for the row labels:


```r
mydata <- read.table("mydata.txt",
                     header=TRUE,
                     row.names="id")
```

## Importing data
Excel files can also be directly imported using `read.xlsx`: 


```r
library(xlsx)
mydata <- read.xlsx("myexcel.xlsx")
```
\vskip .2in
And one can also select a specific sheet in the Excel file: 


```r
mydata <- read.xlsx("myexcel.xlsx", 
                    sheetName = "mysheet")
```

## Other functions for importing data
Other useful importing tools are `scan`, `readLines`, `readr`, and `readxl`. The latter two we will discuss later.


# Introduction to Data Structures

## Importance of data structures

A data structure is a particular way of organizing data in a computer so that it can be used effectively. The idea is to reduce the space and time complexities of different tasks. \vskip .2in

Data structures in R programming are tools for holding multiple values, variables, and sometimes functions.\vskip .2in

Please think very carefully about the way you manage and store your data! This can make your life much easier and make your code and data cleaner and more portable!


## Types of data structures in R
R's base data structures are often organized by their dimensionality (1D, 2D, nD) and whether they’re homogeneous  or heterogeneous (elements of identical or various type). Six of the most common data types are: 

1. Vectors
2. Lists
3. Matrices
4. Arrays
5. Factors
6. Data frames (or tibbles)

# Data Frames

## Data Frames
The most common data structure for storing a dataset in R is in a **data frame**. Conceptually, we can think of a data frame as a two dimensional table with rows representing observations and the different variables reported for each observation defining the columns. Data frames are particularly useful for datasets because we can combine different data types into one object. 

## Data Frames
We can convert matrices into data frames using the function `as.data.frame`:


```r
mat <- matrix(1:12, 4, 3)
mat <- as.data.frame(mat)
```
\vskip .1in

Or just generate it directly using the `data.frame` function:


```r
dat <- data.frame(x=1:4, y=5:8, z=9:12)
```
\vskip .1in

A `data.frame` can be indexed as matrices, `dat[1:2, 2:3]`, and columns can be extracted using the `$` operator.  

# Tibbles

## Tibbles
Here is a printed version of the data frame: 

```r
dat
```

```
##   x y  z
## 1 1 5  9
## 2 2 6 10
## 3 3 7 11
## 4 4 8 12
```

## Tibbles}
A __tibble__ is a modern version of a data.frame. 


```r
library(tidyverse)
dat1 <- tibble(x=1:4, y=5:8, z=9:12)
```
\vskip .1in

Or convert a data.frame to a tibble

```r
dat <- data.frame(x=1:4, y=5:8, z=9:12)
dat1 <- as_tibble(dat)
```
\vskip .1in

## Tibbles
Here is a printed version of the tibble: 


```r
dat1
```

```
## # A tibble: 4 x 3
##       x     y     z
##   <int> <int> <int>
## 1     1     5     9
## 2     2     6    10
## 3     3     7    11
## 4     4     8    12
```


## Tibbles
Important characteristics that make tibbles unique: 

1. Tibbles are primary data structure for the `tidyverse`
2. Tibbles display better and printing is more readable
3. Tibbles can be grouped
4. Subsets of tibbles are tibbles
5. Tibbles can have complex entries--numbers, strings, logicals, lists, functions.
6. Tibbles can (almost) enable object-orientated programming in R  

# Advanced Data Structures in R

## Advanced Data Structures in R

In your homework, you will explore more advanced R data structures, namely the __S3__ and __S4__ class objects. These can facilitate object orientated programming. \vskip .1in

## Advanced Data Structures in R 
One example of an S4 class data structure is the __SummarizedExperiment__ object. 

\begin{center}
	\includegraphics[width=2.75in]{figs/SummarizedExperiment.png}	
\end{center}

## Session info
\tiny

```r
sessionInfo()
```

```
## R version 4.2.3 (2023-03-15)
## Platform: aarch64-apple-darwin20 (64-bit)
## Running under: macOS Ventura 13.3.1
## 
## Matrix products: default
## BLAS:   /Library/Frameworks/R.framework/Versions/4.2-arm64/Resources/lib/libRblas.0.dylib
## LAPACK: /Library/Frameworks/R.framework/Versions/4.2-arm64/Resources/lib/libRlapack.dylib
## 
## locale:
## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
##  [1] lubridate_1.9.2 forcats_1.0.0   stringr_1.5.0   dplyr_1.1.1    
##  [5] purrr_1.0.1     readr_2.1.4     tidyr_1.3.0     tibble_3.2.1   
##  [9] ggplot2_3.4.2   tidyverse_2.0.0
## 
## loaded via a namespace (and not attached):
##  [1] pillar_1.9.0     compiler_4.2.3   tools_4.2.3      digest_0.6.31   
##  [5] timechange_0.2.0 evaluate_0.20    lifecycle_1.0.3  gtable_0.3.3    
##  [9] pkgconfig_2.0.3  rlang_1.1.0      cli_3.6.1        rstudioapi_0.14 
## [13] yaml_2.3.7       xfun_0.38        fastmap_1.1.1    withr_2.5.0     
## [17] knitr_1.42       generics_0.1.3   vctrs_0.6.1      hms_1.1.3       
## [21] grid_4.2.3       tidyselect_1.2.0 glue_1.6.2       R6_2.5.1        
## [25] fansi_1.0.4      rmarkdown_2.21   tzdb_0.3.0       magrittr_2.0.3  
## [29] scales_1.2.1     htmltools_0.5.5  colorspace_2.1-0 utf8_1.2.3      
## [33] stringi_1.7.12   munsell_0.5.0
```

