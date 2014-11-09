#!/usr/bin/env Rscript

# print usage
usage <- function() {
	cat(
'usage: heatcontour.R <file>

heatcontour.R
author: Colby Chiang (cc2qe@virginia.edu)
description: Plot a heat contour plot from two columns of numbers

positional arguments:
  file               File with two columns of numerical values,
                       tab-delimited.
')
}

# Draw a histogram from a text file
args <- commandArgs(trailingOnly=TRUE)
file <- args[1]
filename <- basename(file)

# Check input args
if (is.na(file)) {
	usage()
	quit(save='no', status=1)
}

## Read data into data.fram
df <- read.table(file, sep='\t', col.names=(c('x1', 'x2')))
x1 <- df$x1
x2 <- df$x2

## Use densCols() output to get density at each point
x <- densCols(x1, x2, colramp=colorRampPalette(c("black", "white")))
df$dens <- col2rgb(x)[1,] + 1L

## Map densities to colors
cols <-  colorRampPalette(c("#000099", "#00FEFF", "#45FE4F", 
                            "#FCFF00", "#FF9400", "#FF3100", "#9B0000"))(256)

## Set resolution and make grid
res <- 200
x1.seq <- seq(min(x1), max(x1), diff(range(x1))/res)
x2.seq <- seq(min(x2), max(x2), diff(range(x2))/res)

## Fit loess function to grid
df.loess <-  loess(dens ~ x1 * x2, data = df, degree = 1, span = 0.25)
df.fit <-  expand.grid(list(x1 = x1.seq, x2 = x2.seq))
z <-  predict(df.loess, newdata = df.fit)

## Draw the contour plot
# pdf(paste0(basename(args[1]), '.pdf'), height=5, width=5)
png(paste0(basename(args[1]), '.png'), height=5, width=5, units='in', res=150)
par(mar=c(4,4,1,1))
image(x1.seq, x2.seq, z, col=cols, xlab=paste(filename, 1), ylab=paste(filename, 2), main='')
dev.off()