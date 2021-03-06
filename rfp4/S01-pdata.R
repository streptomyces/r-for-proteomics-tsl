source("S00-env.R")

tab <- readr::read_csv("data/SampleExperimentTable.csv")
names(tab)[1:2] <- c("file", "raw")
tab

id.dir <- "MSGF/"
id.ext <- ".mzid"
raw.dir <- "raw/"
raw.ext <- ".mzML"

## Create paths to files
msgf_files <- paste0(id.dir, tab$file, id.ext)
raw_files <- paste0(raw.dir, tab$file, raw.ext)

msgf_files <- dir("MSGF", full.names = TRUE)
raw_files <- dir("raw", full.names = TRUE)

## Explore experimental design

table(tab$biorep, tab$category)


## All fractions form one sample to run MSnID  
grep("lp-.+t_1_1_", tab$file, value = TRUE)

tab %>% filter(biorep == 1 & techrep == 1) %>% 
  filter(category == "CI" & cleavage == "tryp")

## Note[js]: How to run on all fractions
## for all biosamples 
## for all sample
## for all treatments
## for all cleavages
## at once?
