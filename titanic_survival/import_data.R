#booting up script
#libraries--------------------------------------------------------------------------------
    print("Starting Libraries")
    
    # ipak function: install and load multiple R packages.
    # check to see if packages are installed. Install them if they are not, then load them into the R session.
    
    ipak <- function(pkg){
      new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
      if (length(new.pkg)) 
        install.packages(new.pkg, dependencies = TRUE)
      sapply(pkg, require, character.only = TRUE)
    }
    
    # packages i use, this will replace load libraries script
    packages <- c("Peptides", #protein properties (feautres)
                  "tidyverse", #ggplot2, tidyr, dplyr, forcats, stringr, purr, readr, tibble
                  "gmodels", #might be a ggplot2 dependency/used in varios places
                  "plotly", #make an interactive graph
                  "caret", #Machine learning algorithms
                  "glmnet", #machine learning algorithm
                  "pROC", #Graph ML performance
                  "class", #help manipulate data
                  "neuralnet", #ML neural net model
                  "ggrepel", #probably ggplot stuff not sure
                  "broom", #help clean up data
                  "shiny", #make interacive HTML
                  "htmlwidgets", #export HTML files
                  "rmarkdown", #markdown R script into HTML
                  "gridExtra", #some graphing functions
                  "egg",#add multiple plots to one PDF
                  'pryr'
    )
    
    ipak(packages)
    
    #Need to install biostrings too
    if(("Biostrings" %in% installed.packages()[, "Package"])==FALSE){
      source("https://bioconductor.org/biocLite.R")
      biocLite("Biostrings")
    }
    
    if(("package:Biostrings" %in% search())==FALSE)
      library(Biostrings)
    
    #Extra packages Dan was using that I was not
    #library(class)
    #library(neuralnet)
    #library(ggrepel)
    #library(broom)
    #library(shiny)
    #library(htmlwidgets)
    #library(rmarkdown)
    #library(gridExtra)
    #library(egg)
    print("Libraries Complete")

#importing data------------------------------------------------------------------------------------------
    train_data <- read.csv('~/GitHub/kaggle/titanic_survival/data/train.csv')
    test_data <-  read.csv('~/GitHub/kaggle/titanic_survival/data/test.csv')
    