##
## Fold change analysis ##
## ==================== ##
##
rm(list = ls());
## protein data
eprot <- readRDS("eprot_mascot.rds")
df <- exprs(eprot)
head(df)

## column names - sample repicates
allcol <- colnames(df);
## for the results
sellist <- list();

## which pair of sample types to compare  
interested <- c("C_H", "P_H");
cols.done <- c();

for(sample in interested) {
sre <- paste("^", sample, sep = "");
  
col.lgl <- grepl(sre, allcol); 

just.this <- as.matrix(df[, col.lgl])
cols.done <- c(cols.done, colnames(just.this))

## filter - criterium of reproducibility; 
## protein must be identified in more than 50% of samples within replicates 
## e.g. at least 2 out of 3 replicated must hit a protein
to.qualify <- ceiling(ncol(just.this) / 2);
to.qualify

# head(just.this)



tempv <- c();
for(rn in seq(1, nrow(just.this))) {
  ro <- just.this[rn,]
  lgl <- ro > 1;
  mto <- table(lgl)["TRUE"]
  if(is.na(mto)) { mto <- 0; }
  if(mto >= to.qualify) {
    tempv <- c(tempv, rn)
  }
  # cat(mto)
#  if(rn > 30) {
#    break()
#  }
}
sellist[[sample]] <- tempv;
}
## list of row numbers list = all from [1] or [2]
sellist
## unnique
all <- unique(c(sellist[[1]], sellist[[2]]));
all
## selected proteins hits with at least two peptides in one group 
seldf <- df[all, cols.done]
seldf

## calculate means of selected groups
## what
phc <- grepl("^P_H", colnames(seldf))
phc <- grepl(paste0("^",interested[1]), colnames(seldf))  # beter?
phc
ph <- seldf[, phc]

chc <- grepl("^C_H", colnames(seldf))
chc <- grepl(paste0("^",interested[2]), colnames(seldf))  # beter?
ch <- seldf[, chc]

rownames(ph) <- rownames(seldf)
rownames(ch) <- rownames(seldf)
phm <- rowMeans(ph)
chm <- rowMeans(ch)
## means of both samples we are comparing
mdf <- data.frame(ph = phm, ch = chm)
rownames(mdf) <- rownames(seldf)
head(mdf)

x <- mdf;
head(mdf)
nrow(mdf)
#nrow(y)

x[x$ph == 0, "ph"] <- 0.001;
x[x$ch == 0, "ch"] <- 0.001;

x$ch <- log2(x$ch)
x$ph <- log2(x$ph)
head(x)
x$lfc <- x$ph - x$ch;

ordvec <- order(x$lfc)
y <- x[ordvec,]
head(y)
windows()
# y is in the right order required for plotting
barplot(y$lfc)

mdf$lfc <- y[rownames(mdf), "lfc"]
head(mdf)
y["AT1G02500.1",]

nrow(mdf[abs(mdf$lfc) >= 1, ])
mdf[abs(mdf$lfc) >= 1,]

cols <- c("blue", "red")[(abs(y$lfc) >= 4) + 1]
barplot(y$lfc, col=cols)

## more exxamples on how to produce colored bar plot here:
## https://stackoverflow.com/questions/13112974/change-colours-of-particular-bars-in-a-bar-chart

## check for decoys
temp <- grepl("^XXX_", rownames(mdf))
table(temp)

## go back to mgf, subscript to get differentialy abundant proteins mdf[mdf$lfc>1...], 
## lits the proteins for user to evaluate,
## link it with raw spectral counts
## link with petides



