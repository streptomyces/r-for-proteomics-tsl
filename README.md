## R and Bioconductor for proteomics at the Sainsbury Laboratory



This repository will host the OpenPlant funded *R/Bioconductor for
proteomics* material. The funding was awarded to Jan Sklenar (TSL,
Norwich), Laurent Gatto (UCam), Marielle Vigouroux (JIC), Govind
Chandra (JIC) to introduce and implement the utilisation of
various
[R for proteomics](https://www.bioconductor.org/packages/release/data/experiment/html/RforProteomics.html) tools
in the Sainsbury Laboratory and more generally on the Norwich campus.

The project will run 6 sessions/days over 6 months with the aim to

- Identify needs and opportunities
- Train invdividuals
- Dedicated development and integration with existing tools

## Session 1: Setting the stage (15 Jan 2018)

- Introductory talk: [R and Bioconductor for proteomics](https://rawgit.com/lgatto/2018_01_15_TSL_Norwich/master/rfp.html)

During this session, we discussed the concrete needs and opportunities
that would be tackled as part of this project, and set a schedule for
the sessions until June.

## Session 2: Hands-on introduction to R and Bioconductor for proteomcs (2 Feb 2018)

### Software requirements: R and RStudio

Download and install [R](http://mirrors.ebi.ac.uk/CRAN/)
and [RStudio](https://www.rstudio.com/products/RStudio/). In case you
already have R installed, make you have R 3.4.3. To check the version:

```r
> version
			   _
platform       x86_64-pc-linux-gnu
arch           x86_64
os             linux-gnu
system         x86_64, linux-gnu
status         Patched
major          3
minor          4.3
year           2017
month          12
day            12
svn rev        73903
language       R
version.string R version 3.4.3 Patched (2017-12-12 r73903)
nickname       Kite-Eating Tree
```

Once the software are installed, open RStudio and install Bioconcuctor
packages:

```r
source("http://www.bioconductor.org/biocLite.R")
biocLite(c("MSnbase", "msmsTests", "rpx", "pRoloc", "pRolocdata", "msdata"))
```

![Bioc installation in RStudio](./figs/rstudio-bioc-install.png)

To test the installation, load `MSnbase`:

```r
library("MSnbase")
```

### Programme

- Introduction to R and RStudio and Bioconductor
- R documentation and vignettes
- Variables, vectors and dataframes
- Manipulating data
- Plotting
- Saving and loading data (binary and csv)
- Installing packages

The content of that session is available in the `rfp1` Rproject/dir.

## Session 3: R/Bioconductor tools for MS-based proteomics (21-03-2018)

Summary from last time:

- Using R and RStudio.
- Data structures: vectors, dataframes and MSnSets.
- Subsetting using `[` and `$`.
- Data input: `read.csv` and `readMSnSet2`.
- Data output: `save` and `load`.

We didn't get time to see plotting and package installation.

Material for session 3 will focus on consolidating our understanding
and usage of dedicated R/Bioconductor packages for MS and proteomics.

#### Points to discuss/consider

- For identification, use mzid files, that can be opened with
  `mzR::openIDfile` or `MSnbase:::readMzIdData`. To visualise data
  over time, annotate (with filename and date) and combine there.
- Raw data, with `readMSData(, mode = "onDisk")`.
- Differential expression of count data with `msmsTests`.

  


<br>
<br>

---  
# Final OpenPlant presentation 
---
<br>
## Title: R for Proteomics

#### Date: 11th March 2019

### Abstract:
The final presentation of OpenPlant project aimed to facilitate proteomics data analysis using the existing infrastructure in **R** environment. The objective to organize training and explore **R for Proteomics**, an open source project available in Bioconductor packages was met in several workshops with the developer. The generated code was applied to current JIC/TSL projects. We set up basic proteomics data pipeline that is an independent alternative to the existing, mostly commercial, software. The results of this teamwork, experience working with the **R** packages and perspectives will be presented and discussed by team members.

### Target audience:
Those who carry out proteomics experiments and seek a deeper understanding of data analysis involved and, those wishing to learn to use open source proteomics tools available in **Bioconductor**.  

<br>
### The team:
**Laurent Gatto**, RfP developer, Professor of Bioinformatics, Université catholique de Louvain, Belgium

**Jan Sklenar**, proteomics and mass spectrometry specialist, The Sainsbury Laboratory, Norwich

**Marielle Vigouroux**, Bioinformatician, John Innes Centre, Norwich

**Govind Chandra**, Bioinformatician, John Innes Centre, Norwich

<br>
### Key words:
Proteomics data analysis, R, open source. 

#### GitHub: [github.com/Sjan1/r-for-proteomics-tsl](https://github.com/Sjan1/r-for-proteomics-tsl "link") 